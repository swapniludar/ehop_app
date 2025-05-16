import 'package:flutter/material.dart';
import '../models/service.dart';
import '../widgets/service_grid.dart';

class HomePage extends StatelessWidget {

  final List<Service> services = [
    Service(
      title: 'Health Checks',
      imagePath: 'assets/images/checkup.png',
      color: Colors.redAccent,
    ),
    Service
    (
      title: 'Diagnostic Checks',
      imagePath: 'assets/images/diagnostic.png',
      color: Colors.deepPurple,
    ),
    Service
    (
      title: 'Medicines & Pharmacy',
      imagePath: 'assets/images/examination.png',
      color: Colors.blue,
    ),
    Service
    (
      title: 'Wellness Store',
      imagePath: 'assets/images/relief.png',
      color: Colors.green,
    ),
    Service
    (
      title: 'Diet Consultations',
      imagePath: 'assets/images/test.png',
      color: Colors.green,
    ),
    Service
    (
      title: 'Emotional Therapy',
      imagePath: 'assets/images/test.png',
      color: Colors.green,
    ),
    Service
    (
      title: 'Consult a doctor',
      imagePath: 'assets/images/dental-check.png',
      color: Colors.green,
    ),
    Service
    (
      title: 'Gym Membership',
      imagePath: 'assets/images/test.png',
      color: Colors.green,
    ),
    Service
    (
      title: 'Vision Care',
      imagePath: 'assets/images/test.png',
      color: Colors.green,
    ),
    Service
    (
      title: 'Dental Care',
      imagePath: 'assets/images/dental-check.png',
      color: Colors.green,
    ),
    Service
    (
      title: 'Wellness Plans',
      imagePath: 'assets/images/test.png',
      color: Colors.green,
    ),
    Service
    (
      title: 'Vaccinations',
      imagePath: 'assets/images/x-ray.png',
      color: Colors.green,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ServiceGrid(services: services);
  }
}
