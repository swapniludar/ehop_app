import 'package:ehop_app/models/partner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartnerCard extends StatelessWidget {
  final Partner partner;
  final VoidCallback onChat;

  const PartnerCard({super.key, required this.partner, required this.onChat});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${partner.firstName} ${partner.lastName}"),
            const SizedBox(height: 4.0),
            Text(partner.emailAddress),
            const SizedBox(height: 20),
            Text(partner.speciality),
            const SizedBox(height: 20),
            Text(partner.id),
            const SizedBox(height: 20),
            Text(partner.fcmToken),
            const SizedBox(height: 20),
            CupertinoButton(onPressed: onChat, child: const Text('Chat')),
          ],
        ),
      ),
    );
  }
}
