import { onCall, HttpsError } from "firebase-functions/v2/https";
import * as admin from "firebase-admin";
import * as logger from "firebase-functions/logger";

admin.initializeApp();

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

export const requestOTP = onCall(async (request) => {
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
    const docRef = await admin.firestore().collection("otps").add(otpData);
    logger.info("New document created", { documentId: docRef.id });

    return {
      status: "success",
      otp: generatedOtp,
      startTime: createdAt,
      endTime: expiresAt,
    };
  } catch (error) {
    logger.error("Failed to add document", { error: error }); // log the error
    throw new HttpsError("internal", "Failed to add document", error);
  }
});
