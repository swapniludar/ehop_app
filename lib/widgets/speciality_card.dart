import 'package:flutter/material.dart';
import '../models/doctor_speciality.dart';

class SpecialityCard extends StatelessWidget {
  final DoctorSpeciality specialty;
  final VoidCallback onTap;

  const SpecialityCard({
    Key? key,
    required this.specialty,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double labelFontSize = screenSize.width > 600 ? 16 : 12;
    double height = screenSize.width > 600 ? 16 : 8;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                specialty.color.withOpacity(0.1),
                specialty.color.withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: specialty.color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  specialty.icon,
                  size: 32,
                  color: specialty.color,
                ),
              ),
              SizedBox(height: height),
              // Specialty name with proper text handling
              Flexible(
                child: Text(
                  specialty.name,
                  style: TextStyle(
                    fontSize: 14, // Reduced font size
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1, // Allow 2 lines
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              /*const SizedBox(height: 8),
              Text(
                specialty.description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}