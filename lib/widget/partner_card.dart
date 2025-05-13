import 'package:ehop_app/model/partner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartnerCard extends StatelessWidget {
  final Partner partner;
  final VoidCallback onCall;

  const PartnerCard({super.key, required this.partner, required this.onCall});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${partner.firstName} ${partner.lastName}"),
            const SizedBox(height: 4.0),
            Text(partner.emailAddress),
            const SizedBox(width: 20),
            Text(partner.speciality),
            const SizedBox(width: 20),
            Text(partner.id),
            const SizedBox(width: 20),
            Text(partner.fcmToken),
            const SizedBox(width: 20),
            CupertinoButton(onPressed: onCall, child: const Text('Call')),
          ],
        ),
      ),
    );
  }
}
