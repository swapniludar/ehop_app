import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/doctor1.jpg"),
                ),
                title: Text(
                  "Dr. Doctor Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                subtitle: Text(
                  "Profile"
                ),
              ),
              Divider(height: 50),
              ListTile(
                onTap: (){},
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.person,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: (){},
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
                title: Text(
                  "Notifications",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: (){},
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.privacy_tip_outlined,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
                title: Text(
                  "Privacy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: (){},
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.settings_suggest_outlined,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
                title: Text(
                  "General",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: (){},
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
                title: Text(
                  "About us",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              Divider(height: 40),
              ListTile(
                onTap: (){},
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.logout,
                    color: Colors.redAccent,
                    size: 35,
                  ),
                ),
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

