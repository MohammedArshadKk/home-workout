import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_function_percentage.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Report7X4Challenge extends StatefulWidget {
  const Report7X4Challenge({Key? key}) : super(key: key);

  @override
  State<Report7X4Challenge> createState() => _Report7X4ChallengeState();
}

class _Report7X4ChallengeState extends State<Report7X4Challenge> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: historyListFullbodyNotifire,
      builder: (BuildContext ctx, List<HistoryFullbody> historyfullbodyList, Widget? child) {
        final data = historyfullbodyList.isNotEmpty ? historyfullbodyList[0] : null;
        print("days: ${data?.days}");
        double percentage = data != null ? (3.57 * (data.days ?? 0)) / 100 : 0.0;

        return Column(
          children: [
            const Center(
              child: Text(
                'FULL BODY 7X4 CHALLENGE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 7.0,
              animation: true,
              percent: percentage,
              center: Text(
                '${(percentage * 100).round()}%',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              progressColor: Color(0xFFFFE401),
            ),
          ],
        );
      },
    );
  }
}
