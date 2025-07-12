import 'package:cloud_firestore/cloud_firestore.dart';

class Partners {
  String id;
  String firstName;
  String lastName;
  String emailAddress;
  String speciality;
  String fcmToken;
  String icon;

  Partners(
    this.id,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.speciality,
    this.fcmToken,
    this.icon
  );

  factory Partners.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Partners(
      data['id'] ?? '',
      data['firstname'] ?? '', // Provide default values if fields are missing
      data['lastname'] ?? '',
      data['emailaddress'] ?? '',
      data['speciality'] ?? '',
      data['fcmtoken'] ?? '',
      data['icon'] ?? '',
    );
  }
}
