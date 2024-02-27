import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/Screens/workout/workoutStarted.dart';

class WorkoutRestScreen extends StatefulWidget {
  final List<QueryDocumentSnapshot<Object?>>? filteredDataList;

  const WorkoutRestScreen({Key? key, this.filteredDataList}) : super(key: key);

  @override
  _WorkoutRestScreenState createState() => _WorkoutRestScreenState();
}

class _WorkoutRestScreenState extends State<WorkoutRestScreen> {
  int _timerValue = 10;
  late Timer _timer;
  int length = 0;
  List<QueryDocumentSnapshot<Object?>>? filteredDataListNew;

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            if (widget.filteredDataList == null || length >= widget.filteredDataList!.length) {
              return Center(child: Text("No data"));
            }

            final Map<String, dynamic> map = widget.filteredDataList![length].data() as Map<String, dynamic>;
            final imageUrl = map['imageUrl'];
            final workoutName = map['workoutName'];
            final descriptionWorkout = map['description'];
            filteredDataListNew = widget.filteredDataList;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 380,
                    width: 390,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) => Image.asset('assets/praceholder.jpg'),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
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
                Text(
                  workoutName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 30),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: CircularProgressIndicator(
                        value: _timerValue / 10,
                        strokeWidth: 5,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      '$_timerValue ',
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _timer.cancel();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => WorkoutStartedScreen(
                      filteredDataList: filteredDataListNew,
                    )));
                  },
                  child: Text('SKIP'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_timerValue == 0) {
        timer.cancel();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => WorkoutStartedScreen(
          filteredDataList: filteredDataListNew,
        )));
        return;
      }
      setState(() {
        _timerValue--;
      });
    });
  }
}
