import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_workout/Screens/onclick.dart';

class WorkoutStartedJumpingJacksScreen extends StatefulWidget {
  const WorkoutStartedJumpingJacksScreen({Key? key}) : super(key: key);

  @override
  _WorkoutStartedJumpingJacksScreenState createState() =>
      _WorkoutStartedJumpingJacksScreenState();
}

class _WorkoutStartedJumpingJacksScreenState
    extends State<WorkoutStartedJumpingJacksScreen> {
  int _timerValue = 20;
  late Timer _timer;
  bool _isPaused = false;

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
      if (!_isPaused) {
        if (_timerValue == 0) {
          timer.cancel();
          _showBottomSheet(context);
          return;
        }
        setState(() {
          _timerValue--;
        });
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _togglePause() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                const Text(
                  "Nice,you've\ncompleted\nexercise!",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),
                ),
                const Text(
                  "Day1-Full body 7x4\nCHALLENGE",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                       setState(() {

                        Onclick.onclick=true; 

                      

                         
                       });

                     Navigator.of(context).popUntil((route) => route.isFirst);
                       
                      },
                      child: const Text('DONE'),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFE401),
                    ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              const Text(
                'JUMPING JACKS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    '${_formatTime(_timerValue)}',
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 280,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _togglePause,
                  icon: Icon(_isPaused ? Icons.play_arrow : Icons.pause),
                  label: Text(_isPaused ? 'Resume' : 'Pause'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFE401),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: const Row(
                  children: [
                    Icon(Icons.skip_previous,),
                    Text('Previous',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),)
                  ],
                )),
                const SizedBox(width: 100), 
                IconButton(onPressed: () {
                  _showBottomSheet(context);
                }, icon: const Row(
                  children: [
                    Icon(Icons.skip_next,),
                    Text('Next',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),)
                  ],
                ))
              ],
            ),
          ),
        ),        
      ),
    );
  }
}
