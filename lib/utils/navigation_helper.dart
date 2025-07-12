import 'package:flutter/material.dart';
import '../pages/partners_list_screen.dart';

class NavigationHelper {
  static void navigateToDoctorsList(BuildContext context, String specialtyName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PartnersListScreen(
          specialtyName: specialtyName,
        ),
      ),
    );
  }
}