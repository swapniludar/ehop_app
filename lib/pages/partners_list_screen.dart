import 'package:flutter/material.dart';

class PartnersListScreen extends StatelessWidget {
  final String specialtyName;

  const PartnersListScreen({
    Key? key,
    required this.specialtyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$specialtyName Doctors'),
        backgroundColor: Colors.blue.shade600,
      ),
      body: Center(
        child: Text(
          'Doctors list for $specialtyName will be displayed here',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}