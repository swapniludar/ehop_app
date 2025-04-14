import 'package:cloud_firestore/cloud_firestore.dart';

class Benefit {
  String name;
  String description;

  Benefit(this.name, this.description);

  factory Benefit.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Benefit(
      data['name'] ?? '', // Provide default values if fields are missing
      data['description'] ?? '',
    );
  }
}
