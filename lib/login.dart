import 'package:ehop_app/firebase_options.dart';
import 'package:ehop_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(home: const EhopLoginPage()));
}

class EhopLoginPage extends StatelessWidget {
  const EhopLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ehop login page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _showOTPField = false;

  Future<void> _getOTP() async {
    // Simulate OTP retrieval
    final functions = FirebaseFunctions.instanceFor(region: 'us-central1');
    final result = await functions.httpsCallable('requestOTP').call(
      <String, String>{'emailAddress': _emailController.text},
    );
    print('Cloud Function result: ${result.data}');
    setState(() {
      _showOTPField = true;
    });
  }

  Future<void> _login() async {
    try {
      final functions = FirebaseFunctions.instanceFor(region: 'us-central1');
      print("Function instance created");
      print(_otpController.text);
      print(_emailController.text);
      final result = await functions.httpsCallable('verifyOTP').call({
        "emailAddress": _emailController.text,
        "otp": _otpController.text,
      });
      print('Cloud Function verifyOTP result: ${result.data}');
      if (result.data['status'] == 'success') {
        print("Login successful");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BenefitsPage()),
        );
      } else {
        print("Login failed");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Invalid OTP, try again')));
        setState(() {
          _showOTPField = false;
        });
      }
    } on FirebaseFunctionsException catch (error) {
      print("Login failed");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid OTP, try again')));
      setState(() {
        _showOTPField = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            if (_showOTPField)
              TextField(
                controller: _otpController,
                decoration: const InputDecoration(labelText: 'OTP'),
                keyboardType: TextInputType.number,
              ),
            const SizedBox(height: 20),
            if (!_showOTPField)
              ElevatedButton(onPressed: _getOTP, child: const Text('Get OTP')),
            if (_showOTPField)
              ElevatedButton(onPressed: _login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
