import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ReportLevels extends StatefulWidget {
  const ReportLevels({Key? key}) : super(key: key);

  @override
  State<ReportLevels> createState() => _ReportLevelsState();
}

class _ReportLevelsState extends State<ReportLevels> {
  @override
  Widget build(BuildContext context) {
    num beginnerPercentage = 1.44 * 20;
    num intermediatePercentage = 1.44 * 10;
    num advancedPercentage = 1.44 * 0;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(height: 180,),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'BEGINNER',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10,),
                            CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 3.0,
                              animation: true,
                              percent: beginnerPercentage / 100,
                              center: Text(
                                '${beginnerPercentage.round()}%',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              progressColor: const Color(0xFFFFE401),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'INTERMEDIATE',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10,),
                            CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 3.0, 
                              animation: true,
                              percent: intermediatePercentage / 100, 
                              center: Text(
                                '${intermediatePercentage.round()}%',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              progressColor: const Color(0xFFFFE401),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'ADVANCED',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10,),
                            CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 3.0,
                              animation: true,
                              percent: advancedPercentage / 100, 
                              center: Text(
                                '${advancedPercentage.round()}%',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
            ),
          ),
        ),
      ],
    );
  }
}
