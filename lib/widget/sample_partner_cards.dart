import 'package:ehop_app/model/partner.dart';
import 'package:ehop_app/widget/sample_partner_card.dart';
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
    Partner partner = Partner(
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
    );

    List<Partner> partners = [
      partner,
      partner,
      partner,
      partner,
      partner,
      partner,
      partner,
      partner,
    ];

    return MaterialApp(
      title: 'Hello World App',
      theme: FlexThemeData.light(scheme: FlexScheme.aquaBlue),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.aquaBlue),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(title: Text('Hello World')),
        body: Center(child: PartnerCards(partners: partners)),
      ),
    );
  }
}

class PartnerCards extends StatelessWidget {
  final List<Partner> partners;

  const PartnerCards({super.key, required this.partners});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access current theme
    return SingleChildScrollView(
      child: Column(
        children: List.generate(partners.length, (index) {
          return PartnerCard(partner: partners[index]);
        }),
      ),
    );
  }
}
