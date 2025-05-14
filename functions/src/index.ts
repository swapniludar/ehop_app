import {onCall, HttpsError} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";
import * as logger from "firebase-functions/logger";
import * as nodemailer from "nodemailer";
import {defineSecret} from "firebase-functions/params";

admin.initializeApp();

const emailSenderSecret = defineSecret("EMAIL_SENDER");
const emailPasswordSecret = defineSecret("EMAIL_PASSWORD");

const createTransporter = async () => {
  const emailSender = emailSenderSecret.value();
  const emailPassword = emailPasswordSecret.value();

  return nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: emailSender,
      pass: emailPassword,
    },
  });
};

interface OtpData {
  emailAddress: string;
  otp: number;
  createdAt: Date;
  expiresAt: Date;
  used: boolean;
}

/**
 * Generates a random 6-digit OTP.
 *
 * @return {number} The generated OTP.
 */
function generateOTP(): number {
  const min = 100000;
  const max = 999999;
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

/**
 * Gets the validity period for the OTP.
 *
 * @return {Date[]} An array of creation and expiration time of the OTP.
 */
function getOTPValidityPeriod(): Date[] {
  const createdAt = new Date();
  const periodInMilliSeconds = 5 * 60 * 1000;
  const expiresAt = new Date(createdAt.getTime() + periodInMilliSeconds);
  return [createdAt, expiresAt];
}

/**
 * Sends an OTP email to the given email address.
 *
 * @param {string} email - The recipient's email address.
 * @param {number} otp - The OTP to send.
 */
async function sendOTPEmail(email: string, otp: number) {
  const emailSender = emailSenderSecret.value();
  const mailOptions = {
    from: emailSender,
    to: email,
    subject: "Your OTP",
    html: `<p>Your OTP is <strong>${otp}</strong></p>`,
  };

  try {
    const mailTransport = await createTransporter();
    await mailTransport.sendMail(mailOptions);
    logger.info("OTP email sent successfully", {email: email});
  } catch (error) {
    logger.error("Error sending OTP email", {error, email: email});
    throw new HttpsError("internal", "Error sending OTP email");
  }
}

export const requestOTP = onCall(
  {
    secrets: [emailSenderSecret, emailPasswordSecret],
  },
  async (request) => {
    const emailAddress = request.data.emailAddress;
    const generatedOtp = generateOTP();
    const [createdAt, expiresAt] = getOTPValidityPeriod();

    const otpData: OtpData = {
      emailAddress: emailAddress,
      otp: generatedOtp,
      createdAt: createdAt,
      expiresAt: expiresAt,
      used: false,
    };
    try {
      await sendOTPEmail(emailAddress, generatedOtp);
      const docRef = await admin.firestore().collection("otps").add(otpData);
      logger.info("New document created", {documentId: docRef.id});

      return {
        status: "success",
        id: docRef.id,
        otp: generatedOtp,
        startTime: createdAt,
        endTime: expiresAt,
      };
    } catch (error) {
      logger.error("Failed to add document", {error: error}); // log the error
      throw new HttpsError("internal", "Failed to add document", error);
    }
  },
);

export const verifyOTP = onCall(async (request) => {
  const userEnteredEmail = request.data.emailAddress;
  const userEnteredOtp = request.data.otp;

  logger.error("Verify OTP called");

  let status = "";
  let message = "";
  try {
    const otpRecord = await admin
      .firestore()
      .collection("otps")
      .where("emailAddress", "==", userEnteredEmail)
      .where("used", "==", false)
      .orderBy("createdAt", "desc")
      .limit(1)
      .get();

    if (otpRecord.empty) {
      status = "failure";
      message = "Failed to retrieve OTP";
    } else {
      otpRecord.forEach((doc) => {
        console.log(doc.id, " => ", doc.data());
        if (doc.data().otp == userEnteredOtp &&
              doc.data().expiresAt < new Date()) {
          doc.ref.update({used: true});
          status = "success";
          message = "OTP matches";
        } else {
          status = "failure";
          message = "OTP did not match or it is expired";
        }
      });
    }
  } catch (error) {
    logger.error("Failed to get document", {error: error}); // log the error
    status = "failure";
    message = "Failed to retrieve OTP";
  }
  return {
    status: status,
    message: message,
    otp: userEnteredOtp,
    email: userEnteredEmail,
  };
});

export const sendCallNotification = onCall(async (request) => {
  const callerEmailAddress = request.data.callerEmailAddress;
  const calleeEmailAddress = request.data.calleeEmailAddress;
  const roomId = request.data.roomId;

  if (!callerEmailAddress || !calleeEmailAddress || !roomId) {
    throw new HttpsError("invalid-argument", "Missing required parameters.");
  }

  try {
    const querySnapshot = await admin.firestore()
      .collection("partners")
      .where("emailAddress", "==", calleeEmailAddress)
      .limit(1)
      .get();

    const firstDocument = querySnapshot.docs[0];
    const fcmToken = firstDocument.data()?.fcmToken;

    if (!fcmToken) {
      throw new HttpsError("not-found", "FCM token not found for callee.");
    }

    const message: admin.messaging.Message = {
      token: fcmToken,
      data: {
        type: "incoming_call",
        roomId: roomId,
        callerId: callerEmailAddress,
      },
      android: {
        priority: "high",
      },
      apns: {
        headers: {
          "apns-priority": "10",
        },
      },
    };

    await admin.messaging().send(message);
    return {success: true};
  } catch (error) {
    console.error("Error sending FCM message:", error);
    throw new HttpsError("internal", "Failed to send FCM message.");
  }
});
