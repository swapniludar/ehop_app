import 'package:ehop_app/model/partner.dart';
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
          child: PartnerCard(
            partner: Partner(
              'id',
              'title',
              'name',
              'speciality',
              'experience',
              'assets/images/checkup.png',
              'emailAddress',
              'fcmToken',
              DateTime.now(),
              'details',
              'location',
              0,
              0.0,
            ),
          ),
        ),
      ),
    );
  }
}

class PartnerCard extends StatelessWidget {
  final Partner partner;

  const PartnerCard({super.key, required this.partner});

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.primaryColor,
                      gradient: LinearGradient(
                        colors: [theme.primaryColor, theme.cardColor],
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        partner.profilePictureUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 100,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${partner.title} ${partner.name}",
                            style: theme.textTheme.bodyLarge,
                          ),
                          SizedBox(height: 8),
                          Text(
                            partner.speciality,
                            style: theme.textTheme.bodyMedium,
                          ),
                          SizedBox(height: 8),
                          Text(
                            partner.experience,
                            style: theme.textTheme.bodySmall,
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: theme.elevatedButtonTheme.style,
                    child: Text("Chat", style: theme.textTheme.bodyLarge),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: theme.elevatedButtonTheme.style,
                    child: Text("Call", style: theme.textTheme.bodyLarge),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: theme.elevatedButtonTheme.style,
                    child: Text("In Clinic", style: theme.textTheme.bodyLarge),
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
