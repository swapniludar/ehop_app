import "package:ehop_app/pages/homebody.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";

import "../firebase_options.dart";
import "../utils/appcolors.dart";
import "myehops.dart";
import "mytrackers.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(home: const MyApp(), debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home(),//const MyHomePage(title: 'ehop'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeBody(),
    MyTrackers(),
    MyEhops(),
    HomeBody(),
    HomeBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "e-hop",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,

          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Image.asset(
              'assets/images/ehop_logo_1.jpg',
              height: 50,
              width: 50,
            ),
          ),
        ],
        centerTitle: false,
        backgroundColor: Colors.pink.shade900,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        //selectedItemColor: Colors.teal,
        //unselectedItemColor: Colors.grey,
        elevation: 0,
        backgroundColor: Colors.pink.shade900,
        unselectedItemColor: Colors.grey,
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
            label: 'Trackers',
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

    );
  }
}

