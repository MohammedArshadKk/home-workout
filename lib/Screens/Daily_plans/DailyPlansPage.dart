import 'package:flutter/material.dart';
import 'package:home_workout/Screens/Daily_plans/Workout_creator.dart';
import 'package:home_workout/Screens/Daily_plans/daily_routine.dart';
import 'package:home_workout/Screens/Daily_plans/screen/daily_routine_edit_screen.dart';
import 'package:home_workout/Screens/Daily_plans/user_workout.dart';

class DailyPlansPage extends StatefulWidget {
  const DailyPlansPage({Key? key}) : super(key: key);

  @override
  _DailyPlansPageState createState() => _DailyPlansPageState();
}

class _DailyPlansPageState extends State<DailyPlansPage> {
  String wakeUpTime = '';
  String workoutTime = '';
  String sleepTime = '';

  @override
  Widget build(BuildContext context) {
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
            DailyRoutine(
              wakeUpTime: wakeUpTime,
              workoutTime: workoutTime,
              sleepTime: sleepTime,
            ),
            ElevatedButton(
              onPressed: () async {
                final updatedRoutine = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const DailyRoutineEditScreen(),
                  ),
                );
                if (updatedRoutine != null) {
                  setState(() {
                    wakeUpTime = updatedRoutine['wakeUpTime'];
                    workoutTime = updatedRoutine['workoutTime'];
                    sleepTime = updatedRoutine['sleepTime'];
                  });
                }
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
