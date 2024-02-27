import 'package:flutter/material.dart';
import 'package:home_workout/Screens/home/biginner.dart';
import 'package:home_workout/Screens/home/fullBody.dart';
import 'package:home_workout/screens/home/advanced.dart';
import 'package:home_workout/screens/home/intermediate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE401),
        title: const Text(
          'HOME WORKOUT',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // ignore: prefer_const_constructors
            child: Column(
              children: const [
                FullBody7x4(),
                BiginnerWorkOut(),
                intermediateWorkOut(),
                AdvancedlevelWorkOut()
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}