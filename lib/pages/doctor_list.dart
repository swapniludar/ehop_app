import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../widgets/doctor_card.dart';

class DoctorList extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(name: "Dr. Asha Patil", specialty: "Cardiologist", imagePath: "assets/images/doc1.png"),
    Doctor(name: "Dr. Ravi Deshmukh", specialty: "Dermatologist", imagePath: "assets/images/doc2.png"),
    Doctor(name: "Dr. Sneha Kulkarni", specialty: "Orthopedic", imagePath: "assets/images/doc3.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consult a doctor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) => DoctorCard(doctor: doctors[index]),
        ),
      ),
    );
  }
}