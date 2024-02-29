import 'package:flutter/material.dart';
import 'package:home_workout/Screens/Daily_plans/Workout_creator.dart';
import 'package:home_workout/Screens/Daily_plans/screen/daily_routine_edit_screen.dart';
import 'package:home_workout/Screens/Daily_plans/user_workout.dart';
import 'package:home_workout/database/functions/db_dailyRoutine_function.dart';
import 'package:home_workout/screens/Daily_plans/daily_routine.dart';

class DailyPlansPage extends StatefulWidget {
  const DailyPlansPage({Key? key}) : super(key: key);

  @override
  _DailyPlansPageState createState() => _DailyPlansPageState();
}

class _DailyPlansPageState extends State<DailyPlansPage> {
  @override
  Widget build(BuildContext context) {
    getAlldailyRoutineDetails();
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
            const User_workout(),
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
