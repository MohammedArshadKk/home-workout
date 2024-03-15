import 'package:flutter/material.dart';
import 'package:home_workout/screens/user_workout_Screen.dart';

class UserWorkout extends StatelessWidget {
  const UserWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 60,
        width: 384,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        child: ListTile(
          title: const Text(
            'YOUR WORKOUT',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const UserWorkoutScreen()));
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFFFE401)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
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