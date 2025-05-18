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
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50.0, left:20.0, right: 20.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.lightGreen.shade800,
                      Colors.lightGreen,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello, Jane",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        "assets/images/user.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),

                    )

                  ],
                ),
                /*
                Text(
                  "My Benefits",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child:
                          Image.asset(
                            "assets/images/user.png",
                            height: 30,
                            width: 30,
                            fit:
                            BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Health\nChecks",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child:
                          Image.asset(
                            "assets/images/user.png",
                            height: 30,
                            width: 30,
                            fit:
                            BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Diagnostic\nTests",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child:
                          Image.asset(
                            "assets/images/user.png",
                            height: 30,
                            width: 30,
                            fit:
                            BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Medicines &\nPharmacy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child:
                          Image.asset(
                            "assets/images/user.png",
                            height: 30,
                            width: 30,
                            fit:
                            BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Diet\nConsultations",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child:
                          Image.asset(
                            "assets/images/user.png",
                            height: 30,
                            width: 30,
                            fit:
                            BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Wellness\nStore",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  "Trackers",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child:
                          Image.asset(
                            "assets/images/user.png",
                            height: 30,
                            width: 30,
                            fit:
                            BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Step\n",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child:
                          Image.asset(
                            "assets/images/user.png",
                            height: 30,
                            width: 30,
                            fit:
                            BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Mood\n",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child:
                          Image.asset(
                            "assets/images/user.png",
                            height: 30,
                            width: 30,
                            fit:
                            BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Water\n",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child:
                          Image.asset(
                            "assets/images/user.png",
                            height: 30,
                            width: 30,
                            fit:
                            BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Heart\nRate",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child:
                          Image.asset(
                            "assets/images/user.png",
                            height: 30,
                            width: 30,
                            fit:
                            BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Wellness\nStore",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                  ],
                ),
                */
                SizedBox(height: 20),
                Text(
                  "Health Risks",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                GridHelper(),
              ],
            ),
          )

        ],
      ),
    );
  }
}

