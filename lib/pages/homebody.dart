import 'package:ehop_app/models/mybenefits.dart';
import 'package:flutter/material.dart';
import "package:ehop_app/dal/dao.dart";

import '../widgets/gridhelper.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "e-hop",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,

          ),
        ),
        actions: [
          /*
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {
              // Handle notification icon press
            },
          ),*/
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              'assets/images/ehop_logo_1.jpg',
              height: 50,
              width: 50,
            ),
          ),
        ],
        centerTitle: false,
        backgroundColor: Colors.pink.shade900,
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
                    SizedBox(height: 20),
                    Text(
                      "Hello, Jane",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    /*SizedBox(height: 20),
                    Text(
                      "Health Risks",
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

