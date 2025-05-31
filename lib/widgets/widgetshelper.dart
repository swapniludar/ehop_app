import "package:flutter/material.dart";

import "../pages/partners_screen.dart";

class ServiceHelper extends StatelessWidget {
  final String imageName;
  final String label;

  const ServiceHelper({super.key,
    required this.imageName,
    required this.label,
  });

  String appendNewlineIfSingleWord(String input) {
    if (!input.contains(' ')) {
      return '$input\n';
    }
    else {
      return input.replaceFirst(' ', '\n');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.0,),
        InkWell(
          onTap: () {
            if (label == "Consult a doctor"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PartnersScreen()),
              );
            }

          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child:
            Image.asset(
              imageName,
              height: 40,
              width: 40,
              fit:
              BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5.0,),
        Container(
          width: 65,
          child: Text(
            appendNewlineIfSingleWord(label),
            //label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10.0,),
      ],
    );
  }
  /*
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
            height: 40,
            width: 40,
            fit:
            BoxFit.cover,
          ),

        ),
        SizedBox(height: 5.0,),
        Text(
          appendNewlineIfSingleWord(label),
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
   */
}


