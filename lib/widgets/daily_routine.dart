import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_dailyRoutine_function.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

class DailyRoutine extends StatelessWidget {
  const DailyRoutine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ValueListenableBuilder(
      valueListenable: DailyRoutinelistNotifire,
      builder: (BuildContext ctx, List<DailyRoutineModel> dailyRoutinelist, Widget? child) {
        final data = dailyRoutinelist.isNotEmpty ? dailyRoutinelist[0] : null;
        return Column(
          children: [
            Text(
              'DAILY ROUTINE',
              style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Container(
                height: screenHeight * 0.27,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Text(
                        'WAKE UP    :  ${data?.wakeUp ?? '5:00AM'}',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Text(
                        'WORK OUT TIME :  ${data?.workoutTime ?? '6:00AM'}',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                   const Divider(),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Text(
                        '      SLEEP   :  ${data?.sleep ?? '5:00'}',
                        style: TextStyle(fontSize: screenWidth * 0.04),      
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
