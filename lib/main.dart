import 'package:ehop_app/model/benefit.dart';
import 'package:ehop_app/widget/benefit_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const BenefitsPage()));
}

class BenefitsPage extends StatelessWidget {
  static List<Benefit> benefits = [
    Benefit("benefit 1", "description 1"),
    Benefit("benefit 2", "description 2"),
    Benefit("benefit 3", "description 3"),
  ];

  const BenefitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EHOP Benefits"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: benefits.length,
          itemBuilder: (BuildContext context, int index) {
            return BenefitCard(
              benefit: benefits[index],
              onTap: () => {print("Tapped on ${benefits[index].name}")},
            );
          },
        ),
      ),
    );
  }
}
