import 'package:flutter/material.dart';
import 'package:ehop_app/pages/home_page.dart';
import 'package:ehop_app/pages/my_benefits.dart';
import 'package:ehop_app/pages/my_appointments.dart';
import 'package:ehop_app/pages/profile_page.dart';
import 'package:ehop_app/pages/trackers.dart';
import '../Utils/color.dart';


class HomePageWrapper extends StatefulWidget {
  @override
  _HomePageWrapperState createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MyBenefits(),
    MyAppointments(),
    Tracker(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        //selectedItemColor: Colors.teal,
        //unselectedItemColor: Colors.grey,
        elevation: 0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedItemColor: kPrimaryColor,
        iconSize: 20,
        type: BottomNavigationBarType.fixed,
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
      ),
    );
  }
}