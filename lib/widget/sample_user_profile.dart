import 'package:ehop_app/model/partner.dart';
import 'package:ehop_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      theme: FlexThemeData.light(scheme: FlexScheme.aquaBlue),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.aquaBlue),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(title: Text('Hello World')),
        body: Center(
          child: UserProfileCard(
            user: User(
              'id',
              'title',
              'name',
              DateTime.now(),
              'gender',
              'assets/images/checkup.png',
              DateTime.now(),
              'Organization',
              1234567890,
              ['English', 'Spanish'],
              'emailAddress',
              'fcmToken',
            ),
          ),
        ),
      ),
    );
  }
}

class UserProfileCard extends StatelessWidget {
  final User user;

  const UserProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access current theme

    final screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.9 > 600 ? 600 : screenWidth * 0.9;

    return Center(
      child: Card(
        color: theme.cardColor,
        elevation: 4,
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: cardWidth,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: cardWidth / 3,
                height: cardWidth / 3,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.primaryColor,
                  gradient: LinearGradient(
                    colors: [theme.primaryColor, theme.cardColor],
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(user.profilePictureUrl, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Container(
                  width: cardWidth,
                  margin: EdgeInsets.only(right: 16),
                  padding: EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [theme.primaryColor, theme.cardColor],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.title} ${user.name}',
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Date of Birth: ${user.dob}',
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Gender: ${user.gender}',
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Organization: ${user.organization}',
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Contact Number: ${user.contactNumber}',
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Languages: ${user.languages}',
                        style: theme.textTheme.bodyLarge /**/,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: theme.elevatedButtonTheme.style,
                    child: Text("My Orders", style: theme.textTheme.bodyLarge),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: theme.elevatedButtonTheme.style,
                    child: Text("Settings", style: theme.textTheme.bodyLarge),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: theme.elevatedButtonTheme.style,
                    child: Text(
                      "Privacy Policy",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
