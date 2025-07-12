import 'package:flutter/material.dart';
import '../models/doctor_speciality.dart';

class SpecialitiesData {
  static List<DoctorSpeciality> getAllSpecialties() {
    return [
      DoctorSpeciality(
        name: 'Cardiology',
        description: 'Heart and cardiovascular system',
        icon: Icons.favorite,
        color: Colors.red,
      ),
      DoctorSpeciality(
        name: 'Dermatology',
        description: 'Skin, hair, and nail conditions',
        icon: Icons.face,
        color: Colors.orange,
      ),
      DoctorSpeciality(
        name: 'Neurology',
        description: 'Brain and nervous system',
        icon: Icons.psychology,
        color: Colors.purple,
      ),
      DoctorSpeciality(
        name: 'Orthopedics',
        description: 'Bones, joints, and muscles',
        icon: Icons.accessibility,
        color: Colors.blue,
      ),
      DoctorSpeciality(
        name: 'Pediatrics',
        description: 'Children\'s health and development',
        icon: Icons.child_care,
        color: Colors.pink,
      ),
      DoctorSpeciality(
        name: 'Gynecology',
        description: 'Women\'s reproductive health',
        icon: Icons.woman,
        color: Colors.teal,
      ),
      DoctorSpeciality(
        name: 'Ophthalmology',
        description: 'Eye and vision care',
        icon: Icons.visibility,
        color: Colors.indigo,
      ),
      DoctorSpeciality(
        name: 'ENT',
        description: 'Ear, nose, and throat',
        icon: Icons.hearing,
        color: Colors.green,
      ),
      DoctorSpeciality(
        name: 'Psychiatry',
        description: 'Mental health and disorders',
        icon: Icons.psychology_alt,
        color: Colors.deepPurple,
      ),
      DoctorSpeciality(
        name: 'Gastroenterology',
        description: 'Digestive system disorders',
        icon: Icons.local_hospital,
        color: Colors.amber,
      ),
      DoctorSpeciality(
        name: 'Urology',
        description: 'Urinary system and male reproductive',
        icon: Icons.medical_services,
        color: Colors.cyan,
      ),
      DoctorSpeciality(
        name: 'Endocrinology',
        description: 'Hormones and metabolism',
        icon: Icons.science,
        color: Colors.lime,
      ),
      DoctorSpeciality(
        name: 'Pulmonology',
        description: 'Respiratory system and lungs',
        icon: Icons.air,
        color: Colors.lightBlue,
      ),
      DoctorSpeciality(
        name: 'Oncology',
        description: 'Cancer diagnosis and treatment',
        icon: Icons.health_and_safety,
        color: Colors.deepOrange,
      ),
      DoctorSpeciality(
        name: 'Radiology',
        description: 'Medical imaging and diagnosis',
        icon: Icons.camera_alt,
        color: Colors.grey,
      ),
      DoctorSpeciality(
        name: 'Anesthesiology',
        description: 'Anesthesia and pain management',
        icon: Icons.local_pharmacy,
        color: Colors.blueGrey,
      ),
    ];
  }
}
