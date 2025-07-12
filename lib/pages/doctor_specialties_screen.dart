import 'package:flutter/material.dart';
import '../data/speciality_data.dart';
import '../widgets/speciality_grid.dart';

class DoctorSpecialtiesScreen extends StatelessWidget {
  const DoctorSpecialtiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width > 600 ? 800 : screenSize.width;
    double? headerSize = screenSize.width > 600 ? 24 : 18;
    double? subHeaderSize = screenSize.width > 600 ? 16 : 14;
    final specialties = SpecialitiesData.getAllSpecialties();
    return Scaffold(
      appBar: AppBar(
        //iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          'Doctor Specialties',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
        centerTitle: false,
      ),
      body: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose a specialty',
                style: TextStyle(
                  fontSize: headerSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Find the right doctor for your needs',
                style: TextStyle(
                  fontSize: subHeaderSize,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SpecialityGrid(specialties: specialties),
              ),
            ],
          ),
        ),
      ),
    );
  }
}