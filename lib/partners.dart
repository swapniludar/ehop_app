import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ehop_app/chat.dart';
import 'package:ehop_app/models/partner.dart';
import 'package:ehop_app/widgets/partner_card.dart';
import 'package:flutter/material.dart';

class PartnersPage extends StatelessWidget {
  const PartnersPage({super.key});

  Future<List<Partner>> getPartners() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('partners').get();

    List<Partner> partners =
        querySnapshot.docs.map((doc) {
          return Partner.fromFirestore(
            doc,
            null,
          ); // Assuming your factory method can handle null options
        }).toList();

    return partners;
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onChat() async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChatInitiatePage()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Partners"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<List<Partner>>(
        future: getPartners(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final partners = snapshot.data!;
            return Center(
              child: ListView.builder(
                itemCount: partners.length,
                itemBuilder: (BuildContext context, int index) {
                  return PartnerCard(
                    partner: partners[index],
                    onChat: () => onChat(),
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
