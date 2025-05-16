import 'package:ehop_app/pages/trackers.dart';
import 'package:flutter/material.dart';
import 'package:ehop_app/pages/home_page.dart';
import 'package:ehop_app/pages/my_benefits.dart';
import 'package:ehop_app/pages/my_appointments.dart';
import 'package:ehop_app/pages/profile_page.dart';
//import '../Utils/color.dart';
import 'package:ehop_app/widgets/bottom_nav_bar.dart';

void main() => runApp(HealthCheckApp());

class HealthCheckApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ehop',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MyBenefits(),
    MyAppointments(),
    Tracker(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ehop',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user-account.png'),
              radius: 20,
            ),
          ),
        ],
      ),
      body: Container(
        child: _pages[_currentIndex],

      ),
      bottomNavigationBar: Builder(
        builder: (context) {
          return HomePageWrapper();
        }
      ),
    );
  }
}
