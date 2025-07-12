import 'package:flutter/material.dart';

Color kPrimaryColor = Colors.white;
const Color secondaryBgColor = Colors.white;
const Color cardBgColor = Colors.white70;
const Color profileCardBgColor = Colors.lightBlueAccent;

class AppTheme {
  static Color primaryBlue = Colors.blue.shade600;
  static Color backgroundGradientStart = Colors.blue.shade50;
  static Color backgroundGradientEnd = Colors.white;
  static Color titleColor = Colors.black87;
  static Color subtitleColor = Colors.grey;
  static Color cardTextColor = Colors.grey.shade800;
  static Color cardSubtextColor = Colors.grey.shade600;

  static const Color primaryColor = Color(0xFF667eea);
  static const Color secondaryColor = Color(0xFF764ba2);
  static const Color accentColor = Color(0xFFf093fb);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColor, secondaryColor, accentColor],
  );

  static const TextStyle appNameStyle = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 2.0,
    shadows: [
      Shadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  );

  static const TextStyle taglineStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    letterSpacing: 1.0,
  );
}