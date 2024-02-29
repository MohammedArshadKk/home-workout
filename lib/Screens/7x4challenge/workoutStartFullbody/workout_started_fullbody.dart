import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/Screens/onclick.dart';
import 'package:home_workout/database/functions/db_function_percentage.dart';
import 'package:home_workout/database/functions/db_functions.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';
import 'package:home_workout/screens/workout/workoutStarted.dart';

class WorkoutStartedScreenFullBody extends StatefulWidget {
  final List<QueryDocumentSnapshot<Object?>>? filteredDataList;

  const WorkoutStartedScreenFullBody({
    Key? key,
    required this.filteredDataList,
  }) : super(key: key);

  @override
  _WorkoutStartedScreenFullBodyState createState() =>
      _WorkoutStartedScreenFullBodyState();
}

class _WorkoutStartedScreenFullBodyState
    extends State<WorkoutStartedScreenFullBody> {
  int _timerValue = 60;
  Timer? _timer;
  bool _isPaused = false;
  int length = 0;
  int count = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            if (widget.filteredDataList == null ||
                length >= widget.filteredDataList!.length) {
              return const Center(child: Text("No data"));
            }

            final Map<String, dynamic> map =
                widget.filteredDataList![length].data() as Map<String, dynamic>;
            dynamic imageUrlNew = map['imageUrl'];
            String? workoutNameNew = map['workoutName'];
            String? durationNew = map['duration'];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 380,
                    width: 390,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(imageUrlNew),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Text(
                      '$workoutNameNew',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(durationNew ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 24))
                  ],
                ),
                const SizedBox(height: 30),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      _formatTime(_timerValue),
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
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      length--;
                      if (length < 0) length = 0;
                    });
                    _startTimer();
                  },
                  icon: const Row(
                    children: [
                      Icon(Icons.skip_previous),
                      Text('Previous',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                const SizedBox(width: 100),
                IconButton(
                  onPressed: () {
                    setState(() {
                      length++;
                      if (length >= widget.filteredDataList!.length) {
                        length = widget.filteredDataList!.length - 1;
                        _showBottomSheet(context);
                      }
                    });
                    final _History = HistoryModel(
                      gif: imageUrlNew,
                      workOutName: workoutNameNew,
                      duration: durationNew,
                    );
                    addWorkoutHistory(_History);
                    _startTimer();
                  },
                  icon: const Row(
                    children: [
                      Icon(Icons.skip_next),
                      Text('Next',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _timer?.cancel();
    _timerValue = 60;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (!_isPaused) {
        if (_timerValue == 0) {
          timer.cancel();
          setState(() {
            length++;
            if (length >= widget.filteredDataList!.length) {
              length = widget.filteredDataList!.length - 1;
              _showBottomSheet(context);
            }
            final _History = HistoryModel(
              gif: imageUrlNew,
              workOutName: workoutNameNew,
              duration: durationNew,
            );
            addWorkoutHistory(_History);
          });
          _startTimer();
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
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset('assets/congratulations.gif')),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Nice, you've completed the exercise!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Onclick.onclick = true;
                          count++;
                        });
                        print('Count: $count');
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                         final fullBody=  HistoryFullbody(days: count);
                         addWorkoutFullBodyHistory(fullBody);

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
}
