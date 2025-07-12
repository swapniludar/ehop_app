import "package:flutter/material.dart";
import "../models/benefit.dart";
import "../pages/consult_doctor_screen.dart";

import "../pages/partners_screen.dart.old";

class ServiceHelper1 extends StatelessWidget {
  final String imageName;
  final String label;


  const ServiceHelper1({super.key,
    required this.imageName,
    required this.label,
  });


  String appendNewlineIfSingleWord(String input) {
    //print("object"+ input.toString());
    if (!input.contains(' ')) {
      return '$input\n';
    }
    else {
      return input.replaceFirst(' ', '\n');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double imageSz = screenWidth / 9 > 60 ? 80 : screenWidth / 9;

    return Column(
      children: [
        SizedBox(height: 10.0,),
        InkWell(
          onTap: () {
            if (label == "Consult a doctor"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConsultDoctorScreen()),
              );
            }

          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child:
            Image.asset(
              imageName,
              height: imageSz,
              width: imageSz,
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
              color: Colors.black,
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
}

class ServiceHelper extends StatelessWidget {
  //final String imageName;
  ////final String label;
  ////final String iconName;
  ////final String iconColor;

  final MyBenefit benefit;
  final VoidCallback onTap;

  /*const ServiceHelper({super.key,
    required this.label,
    required this.iconName,
    required this.iconColor,
  });*/

  const ServiceHelper({
    Key? key,
    required this.benefit,
    required this.onTap,
  }) : super(key: key);

  String appendNewlineIfSingleWord(String input) {
    //print("object"+ input.toString());
    if (!input.contains(' ')) {
      return '$input\n';
    }
    else {
      return input.replaceFirst(' ', '\n');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double imageSz = screenWidth / 9 > 60 ? 80 : screenWidth / 9;

    return Column(
      children: [
        SizedBox(height: 10.0,),
        InkWell(
          onTap: () {
            if (benefit.name == "Consult a doctor"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConsultDoctorScreen()),
              );
            }

          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child:
            /*Image.asset(
              imageName,
              height: imageSz,
              width: imageSz,
              fit:
              BoxFit.cover,
            ),*/
            Icon(
              benefit.iconName,
              size: 32,
              color: benefit.iconColor,
            ),
          ),
        ),
        SizedBox(height: 5.0,),
        Container(
          width: 65,
          child: Text(
            appendNewlineIfSingleWord(benefit.name),
            //label,
            style: TextStyle(
              color: Colors.black,
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
}


