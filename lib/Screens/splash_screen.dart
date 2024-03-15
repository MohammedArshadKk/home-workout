import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_workout/Screens/login_screen.dart';

class SplashScreen extends StatefulWidget {   
 const SplashScreen({super.key});
 @override
 State<SplashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<SplashScreen> {
 @override
 void initState() {
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const Loginscreen())));

    super.initState();
 }

 @override
 Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: screenHeight * 0.5,
          width: screenWidth,
          child: Image.asset(
            'assets/splash.gif',
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
 }
}
