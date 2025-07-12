import 'package:flutter/cupertino.dart';

class DoctorSpeciality {
  final String name;
  final String description;
  final IconData icon;
  final Color color;

  const DoctorSpeciality({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
  });
}