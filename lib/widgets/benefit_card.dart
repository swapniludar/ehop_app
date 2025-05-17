import 'package:ehop_app/models/benefit.dart';
import 'package:flutter/material.dart';

class BenefitCard extends StatelessWidget {
  final Benefit benefit;
  final VoidCallback onTap;

  const BenefitCard({super.key, required this.benefit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(benefit.name),
              const SizedBox(width: 20),
              Text(benefit.description),
            ],
          ),
        ),
      ),
    );
  }
}
