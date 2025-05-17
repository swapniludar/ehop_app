import 'package:cloud_firestore/cloud_firestore.dart';

class MyBenefit {
  String title;
  String imagePath = "assets/images/user.png";
  String description;

  MyBenefit(this.title, this.description);

  factory MyBenefit.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return MyBenefit(
      data['title'] ?? '', // Provide default values if fields are missing
      data['description'] ?? '',
    );
  }
}
