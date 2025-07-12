import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/benefit.dart';

final benefitsProvider = FutureProvider<List<MyBenefit>>((ref) async {
  final snapshot = await FirebaseFirestore.instance.collection('benefits').get();
  return snapshot.docs.map((doc) => MyBenefit.fromMap(doc.id, doc.data())).toList();
});