import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

export const helloWorld = functions.https.onRequest((request, response) => {
  response.send("Hello from Firebase!");
});

interface RequestData {
  emailAddress: string;
}

interface ResponseData {
  status: string;
  otp: number;
}

export const requestOTP = functions.https.onCall<RequestData, ResponseData>(
  (request) => {
    const email = request.data.emailAddress;
    const generatedOtp = email.length;
    return {status: "success", otp: generatedOtp};
  },
);
