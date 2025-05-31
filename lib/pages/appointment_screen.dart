import 'package:ehop_app/pages/video_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_sample.dart';
import 'chat_screen.dart';

class AppointmentScreen extends StatelessWidget {

  List imgs = [
    "user.png",
    "user.png",
    "user.png",
    "user.png",

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade600,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/doctor1.jpg"),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Dr. Doctor Name",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Therapist",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => VideoScreen()),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.call,
                                  color: Colors.pink.shade800,
                                  size: 25,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ChatScreen()),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  CupertinoIcons.chat_bubble_text_fill,
                                  color: Colors.pink.shade800,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              //height: MediaQuery.of(context).size.height / 1.5,
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              padding: EdgeInsets.only(top: 20, left: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "About Doctor",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Dr. Doctor Name, Ph.D., is a highly experienced Clinical Psychologist and Therapist with over 10 years of expertise in treating anxiety, depression, stress, and relationship issues through evidence-based approaches like Cognitive Behavioral Therapy (CBT). She holds a Ph.D. in Clinical Psychology from the University of Delhi and is certified by the Rehabilitation Council of India. Dr. Mehta provides a compassionate, client-centered approach to therapy, offering both in-person and online sessions in English, Hindi, and Marathi. She practices at MindCare Therapy Center in Mumbai, with consultations available Monday to Saturday, and charges ₹1,500 per 45-minute session.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Reviews",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.star, color: Colors.amber),
                        Text("4.9",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text("(124)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.pink.shade800
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}