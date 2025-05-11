import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/service.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  final VoidCallback onTap;

  const ServiceCard({super.key, required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              service.imagePath,
              height: 20,
              width: 20,
              fit: BoxFit.contain,

            ),
          ),
          Expanded(
            child: Text(
              service.title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}