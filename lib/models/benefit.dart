import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Benefit {
  String name;
  String description;

  Benefit(this.name, this.description);

  factory Benefit.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Benefit(
      data['name'] ?? '', // Provide default values if fields are missing
      data['description'] ?? '',
    );
  }
}

class MyBenefit {
  final String id;
  final String name;
  final String description;
  final String icon;
  final String color;

  MyBenefit({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color
  });

  IconData get iconName => _getIconFromName(icon);
  Color get iconColor => _getColorFromHex(color);

  IconData _getIconFromName(String name) {
    switch (name) {
      case 'local_pharmacy':
        return Icons.local_pharmacy;
      case 'psychology':
        return Icons.psychology;
      case 'medical_services':
        return Icons.medical_services;
      case 'shopping_cart':
        return Icons.shopping_cart;
      case 'science':
        return Icons.science;
      case 'vaccines':
        return Icons.vaccines;
      case 'assignment':
        return Icons.assignment;
      case 'restaurant':
        return Icons.restaurant;
      case 'medical_information':
        return Icons.medical_information;
      case 'visibility':
        return Icons.visibility;
      case 'monitor_heart':
        return Icons.monitor_heart;
      case 'fitness_center':
        return Icons.fitness_center;
      default:
        return Icons.medical_services;
    }
  }

  Color _getColorFromHex(String hex) {
    try {
      return Color(int.parse(hex.replaceAll('#', '0xFF')));
    } catch (e) {
      return const Color(0xFF3498DB);
    }
  }

  factory MyBenefit.fromMap(String id, Map<String, dynamic> data) {
    return MyBenefit(
      id: id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      icon: data['icon'] ?? 'medical_services',
      color: data['color'] ?? '#3498DB',
    );
  }
}


