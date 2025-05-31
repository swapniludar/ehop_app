import 'package:ehop_app/models/mybenefits.dart';
import 'package:flutter/material.dart';
import "package:ehop_app/dal/dao.dart";

import '../widgets/gridhelper.dart';

class MyTrackers extends StatefulWidget {
  const MyTrackers({super.key});

  @override
  State<MyTrackers> createState() => _MyTrackersState();
}

class _MyTrackersState extends State<MyTrackers> {
  /*
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.shade900,
                    Colors.pink.shade600,
                  ],
                    begin: Alignment.topRight,

                    end: Alignment.bottomLeft
                ),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trackers",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  GridHelper(),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink.shade900,
        title: Text(
          "Trackers",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.pink.shade900,
                        Colors.pink.shade600,
                      ],
                      begin: Alignment.topRight,
      
                      end: Alignment.bottomLeft
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*Text(
                      "Trackers",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),*/
                    SizedBox(height: 30.0),
                    GridHelper(),
                  ],
                ),
              )
      
            ],
          ),
        ),
      ),
    );
  }
}

