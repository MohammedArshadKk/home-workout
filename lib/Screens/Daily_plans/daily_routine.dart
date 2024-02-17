import 'package:flutter/material.dart';

class DailyRoutine extends StatelessWidget {
  final String wakeUpTime;
  final String workoutTime;
  final String sleepTime;

  const DailyRoutine({
    required this.wakeUpTime,
    required this.workoutTime,
    required this.sleepTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'DAILY ROUTINE',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 218,
            width: 384,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'WAKE UP    :  $wakeUpTime',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'WORK OUT TIME :  $workoutTime',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    '      SLEEP   :  $sleepTime',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                
              ],
            ),
          ),
        )
      ],
    );
  }
}
