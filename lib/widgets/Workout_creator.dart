import 'package:flutter/material.dart';
import 'package:home_workout/screens/workout_creator_Screen.dart';

class WorkoutCreator extends StatelessWidget {
  const WorkoutCreator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Container(
        height: screenWidth * 0.52,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: const Color(0xFFFFE401),
          borderRadius: BorderRadius.circular(screenWidth * 0.013),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.078),
              child: Column(
                children: [
                  Text(
                    'WORKOUT CREATER',
                    style: TextStyle(fontSize: screenWidth * 0.046),
                  ),
                  Text(
                    'CUSTOM\nWORKOUT          ',
                    style: TextStyle(
                        fontSize: screenWidth * 0.056,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.052),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const WorkoutCreatorScreen()));
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
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.027),
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
