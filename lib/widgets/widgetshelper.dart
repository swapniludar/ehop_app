import "package:flutter/material.dart";

class ServiceHelper extends StatelessWidget {
  final String imageName;
  final String label;

  const ServiceHelper({super.key,
    required this.imageName,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.0,),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child:
          Image.asset(
            imageName,
            height: 30,
            width: 30,
            fit:
            BoxFit.cover,
          ),
        ),
        SizedBox(height: 5.0,),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.0,),
      ],
    );
  }
}


