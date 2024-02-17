import 'package:flutter/material.dart';
import 'package:home_workout/Screens/7x4challenge/weeks/week1.dart';
import 'package:home_workout/Screens/7x4challenge/weeks/week2.dart';
import 'package:home_workout/Screens/7x4challenge/weeks/week3.dart';
import 'package:home_workout/Screens/7x4challenge/weeks/week4.dart';

class fullBody7X4Challenge extends StatelessWidget {
  const fullBody7X4Challenge({super.key});

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
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Week1(),
              SizedBox(height: 20,),
              Week2(),
               SizedBox(height: 20,),
               Week3(),
                SizedBox(height: 20,),
               Week4()
            ],
          ),
        ),
      ),
    );
  }
}