import 'package:cloud_firestore/cloud_firestore.dart';

class Partner {
  String id;
  String firstName;
  String lastName;
  String emailAddress;
  String speciality;
  String fcmToken;

  Partner(
    this.id,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.speciality,
    this.fcmToken,
  );

  factory Partner.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Partner(
      data['id'] ?? '',
      data['firstName'] ?? '',
      data['lastName'] ?? '',
      data['emailAddress'] ?? '',
      data['speciality'] ?? '',
      data['fcmToken'] ?? '',
    );
  }
}
