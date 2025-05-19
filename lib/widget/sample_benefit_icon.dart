import 'package:ehop_app/model/benefit_icon.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

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
          child: BenefitIconView(
            benefitIcon: BenefitIcon(
              'id',
              'title',
              'assets/images/checkup.png',
            ),
          ),
        ),
      ),
    );
  }
}

class BenefitIconView extends StatelessWidget {
  final BenefitIcon benefitIcon;

  const BenefitIconView({super.key, required this.benefitIcon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access current theme
    final screenWidth = MediaQuery.of(context).size.width;
    double imageSz = screenWidth / 11 > 60 ? 60 : screenWidth / 11;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
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
              benefitIcon.iconUrl,
              width: imageSz,
              height: imageSz,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(benefitIcon.title, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}
