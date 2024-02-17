import 'package:flutter/material.dart';

class workout_creator_Screen extends StatelessWidget {
  const workout_creator_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        backgroundColor: Color(0xFFFFE401),
        title: Text(
          'ADD EXERCISES',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}