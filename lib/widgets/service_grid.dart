import 'package:flutter/material.dart';
import '../models/service.dart';
import 'service_card.dart';
import '../pages/doctor_list.dart';

class ServiceGrid extends StatelessWidget {
  final List<Service> services;

  const ServiceGrid({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 1000
            ? 10
            : constraints.maxWidth > 600
            ? 3
            : 5;

        return GridView.builder(
          itemCount: services.length,
          padding: const EdgeInsets.all(0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //crossAxisCount: crossAxisCount,
            //childAspectRatio: 1,
            //mainAxisExtent: 100,
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            return ServiceCard(
              service: services[index],
              onTap: () {
                if (services[index].title == 'Consult a doctor') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DoctorList()),
                  );
                } else {
                  print('Tapped: ${services[index].title}');
                }
              },
            );
          },
        );
      },
    );
  }
}