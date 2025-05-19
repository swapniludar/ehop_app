import 'package:ehop_app/model/benefit_icon.dart';
import 'package:ehop_app/widget/sample_benefit_icon.dart';
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
    BenefitIcon benefitIcon = BenefitIcon(
      'id',
      'title',
      'assets/images/checkup.png',
    );
    List<BenefitIcon> benefitIcons = [
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
      benefitIcon,
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
        body: Center(child: BenefitIconGridView(benefitIcons: benefitIcons)),
      ),
    );
  }
}

class BenefitIconGridView extends StatelessWidget {
  final List<BenefitIcon> benefitIcons;

  const BenefitIconGridView({super.key, required this.benefitIcons});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access current theme
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        // Adjust max width as needed
        child: GridView.count(
          crossAxisCount: 5,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: EdgeInsets.all(8),
          shrinkWrap: true,
          // Important if inside another scrollable widget
          physics: NeverScrollableScrollPhysics(),
          // Prevents nested scrolling
          children: List.generate(benefitIcons.length, (index) {
            return BenefitIconView(benefitIcon: benefitIcons[index]);
          }),
        ),
      ),
    );
  }
}
