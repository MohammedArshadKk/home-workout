import 'package:flutter/material.dart';
import 'package:home_workout/screens/workout_creator_Screen.dart';

class Workout_creator extends StatelessWidget {
  const Workout_creator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 200,
        width: 384,
        decoration: BoxDecoration(
            color: const Color(0xFFFFE401),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text(
                    'WORKOUT CREATER',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'CUSTOM\nWORKOUT          ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>WorkoutCreatorScreen()));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,                    
                    ),
                    label: const Text(
                      'CREATE',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
