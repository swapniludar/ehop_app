import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ehop_app/model/benefit.dart';
import 'package:ehop_app/partners.dart';
import 'package:ehop_app/widget/benefit_card.dart';
import 'package:flutter/material.dart';

class BenefitsPage extends StatelessWidget {
  Future<List<Benefit>> getBenefits() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('benefits_trial').get();

      List<Benefit> benefits =
          querySnapshot.docs.map((doc) {
            return Benefit.fromFirestore(
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

  const BenefitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> onBenefitTap() async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PartnersPage()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("EHOP Benefits"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<List<Benefit>>(
        future: getBenefits(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final benefits = snapshot.data!;
            return Center(
              child: ListView.builder(
                itemCount: benefits.length,
                itemBuilder: (BuildContext context, int index) {
                  return BenefitCard(
                    benefit: benefits[index],
                    onTap: () => onBenefitTap(),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text('No benefits found'));
          }
        },
      ),
    );
  }
}
