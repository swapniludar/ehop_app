import 'package:ehop_app/Utils/color.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(EhopApp());
}


class EhopApp extends StatefulWidget {
  const EhopApp({super.key});

  @override
  State<EhopApp> createState() => _EhopApp();
}

class _EhopApp extends State<EhopApp> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,

    );
  }
}
