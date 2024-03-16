import 'package:flutter/material.dart';
import 'package:home_workout/screens/user_workout_Screen.dart';

class UserWorkout extends StatelessWidget {
  const UserWorkout({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Container(
        height: screenHeight * 0.1,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.013),
          border: Border.all(color: Colors.grey),
        ),
        child: ListTile(
          title: Text(
            'YOUR WORKOUT',
            style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
          ),
          trailing: Padding(
            padding: EdgeInsets.all(screenWidth * 0.013),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const UserWorkoutScreen()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFFE401)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.027),
                  ),
                ),
              ),
              child: const Text(
                'START',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
