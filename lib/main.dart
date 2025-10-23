import 'package:flutter/material.dart';
import 'package:toku_app/screens/home_screen.dart';

void main() {
  runApp(const TokuApp());
}

class TokuApp extends StatelessWidget {
  const TokuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class TestLogo extends StatelessWidget {
  const TestLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/logo_1.png', height: 100)),
    );
  }
}
