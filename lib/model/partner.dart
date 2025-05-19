import 'package:cloud_firestore/cloud_firestore.dart';

class Partner {
  String id;
  String title;
  String name;
  String speciality;
  String experience;
  String profilePictureUrl;
  String emailAddress;
  String fcmToken;
  DateTime activeSince;
  String bio;
  String location;
  int servicesAvailed;
  double rating;

  Partner(
    this.id,
    this.title,
    this.name,
    this.speciality,
    this.experience,
    this.profilePictureUrl,
    this.emailAddress,
    this.fcmToken,
    this.activeSince,
    this.bio,
    this.location,
    this.servicesAvailed,
    this.rating,
  );

  factory Partner.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Partner(
      data['id'] ?? '',
      data['title'] ?? '',
      data['name'] ?? '',
      data['speciality'] ?? '',
      data['experience'] ?? '',
      data['profilePictureUrl'] ?? '',
      data['emailAddress'] ?? '',
      data['fcmToken'] ?? '',
      data['activeSince']?.toDate() ?? DateTime.now(),
      data['details'] ?? '',
      data['location'] ?? '',
      data['servicesAvailed'] ?? 0,
      data['rating'] ?? 0.0,
    );
  }
}
