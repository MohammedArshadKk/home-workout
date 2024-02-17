import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_workout/Screens/7x4challenge/workout/workoutStarted.dart';

class WorkoutStartScreen extends StatefulWidget {
  const WorkoutStartScreen({Key? key}) : super(key: key);

  @override
  _WorkoutStartScreenState createState() => _WorkoutStartScreenState();
}

class _WorkoutStartScreenState extends State<WorkoutStartScreen> {
  int _timerValue = 10; 
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_timerValue == 0) {
        timer.cancel();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => WorkoutStartedJumpingJacksScreen()));
        return;
      }
      setState(() {
        _timerValue--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 380,
                  width: 390,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/JUMPING JACKS.gif',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'READY TO GO',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    color: Color.fromARGB(255, 39, 32, 240),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'JUMPING JACKS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    width: 120 ,
                    child: CircularProgressIndicator(
                      value: _timerValue / 10, // Updated to 10 seconds
                      strokeWidth: 5,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    '$_timerValue ',
                    style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _timer.cancel();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => WorkoutStartedJumpingJacksScreen()));
                },
                child: Text('SKIP'), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
