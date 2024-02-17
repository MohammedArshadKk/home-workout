import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Report7X4Challenge extends StatefulWidget {
  const Report7X4Challenge({Key? key}) : super(key: key);

  @override
  State<Report7X4Challenge> createState() => _Report7X4ChallengeState();
}

class _Report7X4ChallengeState extends State<Report7X4Challenge> {
  @override
  Widget build(BuildContext context) {
    double percentage = 3.57;    

    return Column(
      children: [
        const Center(
          child: Text(
            'FULL BODY 7X4 CHALLENGE',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        CircularPercentIndicator(
          radius: 100.0,
          lineWidth: 20.0,
          animation: true,
          percent: percentage / 100, 
          center: Text('$percentage%',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),), 
          progressColor: const Color(0xFFFFE401),
        )
      ],
    );
  }
}

