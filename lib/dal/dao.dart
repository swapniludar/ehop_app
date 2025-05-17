import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ehop_app/models/mybenefits.dart';
import 'package:flutter/material.dart';

class Dao {

  static Future<List<MyBenefit>> getBenefits() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('health_benefits').get();

      List<MyBenefit> benefits =
      querySnapshot.docs.map((doc) {
        return MyBenefit.fromFirestore(
          doc,
          null,
        ); // Assuming your factory method can handle null options
      }).toList();

      return benefits;
    } catch (e) {
      print("Error getting benefits: $e");
      return []; // Return an empty list in case of error
    }
  }

}