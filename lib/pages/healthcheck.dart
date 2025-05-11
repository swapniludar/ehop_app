import 'package:ehop_app/pages/trackers.dart';
import 'package:flutter/material.dart';
import 'package:ehop_app/pages/home_page.dart';
import 'package:ehop_app/pages/my_benefits.dart';
import 'package:ehop_app/pages/my_appointments.dart';
import 'package:ehop_app/pages/profile_page.dart';
import '../Utils/color.dart';
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
          /*return BottomNavigationBar(
            currentIndex: _currentIndex,
            /*selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey[600], // more visible gray
            selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,*/
            elevation: 0,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black,
            selectedItemColor: kPrimaryColor,
            iconSize: 30,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                tooltip: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long),
                label: 'My e-hops',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long),
                label: 'My Appointments',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long),
                label: 'Trackers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );*/
        }
      ),
    );
  }
}
