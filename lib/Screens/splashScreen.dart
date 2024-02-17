import 'dart:async';
import 'package:flutter/material.dart';
import 'package:home_workout/Screens/loginScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _splashScreenState();
}
class _splashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Loginscreen())));
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(    
        child: Image.asset('assets/splash.jpg',),
      ),
    );
  }
}