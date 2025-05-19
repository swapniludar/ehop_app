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
          child: PartnerProfileCard(
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
              'A well-written objective or summary on your resume can be '
                  'the difference between getting rejected, '
                  'or getting invited for an interview. Copy any of '
                  'these Doctor objective or summary examples, and use it as '
                  'inspiration for your own resume. All examples are written '
                  'by certified resume experts, and free for personal use. ',
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

class PartnerProfileCard extends StatelessWidget {
  final Partner partner;

  const PartnerProfileCard({super.key, required this.partner});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: cardWidth / 2,
                height: cardWidth / 2,
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
              SizedBox(height: 16),
              Expanded(
                child: Container(
                  width: cardWidth,
                  height: cardWidth,
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
                        "${partner.title} ${partner.name}",
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 8),
                      Text(
                        partner.bio,
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Doctor has served ${partner.servicesAvailed} '
                            'patients since ${partner.activeSince}.'
                            'The patients have rated the doctors '
                            'service ${partner.rating} stars.',
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 8),
                      Text(
                        partner.location,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
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
