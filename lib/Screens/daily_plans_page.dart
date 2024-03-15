import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_customworkout_function.dart';
import 'package:home_workout/database/functions/db_dailyRoutine_function.dart';
import 'package:home_workout/screens/daily_routine_edit_screen.dart';
import 'package:home_workout/widgets/Workout_creator.dart';
import 'package:home_workout/widgets/daily_routine.dart';
import 'package:home_workout/widgets/user_workout.dart';

class DailyPlansPage extends StatefulWidget {
  const DailyPlansPage({Key? key}) : super(key: key);

  @override
  _DailyPlansPageState createState() => _DailyPlansPageState();
}

class _DailyPlansPageState extends State<DailyPlansPage> {
  @override
  Widget build(BuildContext context) {
    getAlldailyRoutineDetails();
    getAllCustomWorkout();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE401),
        title: const Center(
          child: Text(
            'DAILY PLANS',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Workout_creator(),
            const UserWorkout(),
            const DailyRoutine(),
            ElevatedButton(
              onPressed: ()  {
                 Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const DailyRoutineEditScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFE401), 
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(5), 
                ),
              ),
              child: const Text('EDIT'),
            ),
          ],
        ),
      ),
    );
  }
}
