import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_workoutlevels_function.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ReportLevels extends StatefulWidget {
  const ReportLevels({Key? key}) : super(key: key);

  @override
  State<ReportLevels> createState() => _ReportLevelsState();
}

class _ReportLevelsState extends State<ReportLevels> {
  @override
  Widget build(BuildContext context) {
    // num beginnerPercentage = 1.44 * 20;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ValueListenableBuilder(
            valueListenable: historyLevelsListNotifire,
            builder:  (BuildContext ctx, List<HistoryLevels> historylevelsList, Widget? child){
 final data = historylevelsList.isNotEmpty ? historylevelsList[0] : null;
        final daysCompleted = data?.levels ?? 0;
        double percentage = 8.33 * daysCompleted;
     return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 180,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'WORKOUT LEVELS',
                              style: TextStyle(
                                  fontSize: 20, fontWeight:FontWeight.bold),  
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 3.0,
                              animation: true,
                              percent: percentage / 100,
                              center: Text(
                                '${percentage.round()}%',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              progressColor: const Color(0xFFFFE401),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
            },
            
          ),
        ),
      ],
    );
  }
}
