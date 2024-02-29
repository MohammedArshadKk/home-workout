import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_dailyRoutine_function.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

class DailyRoutine extends StatelessWidget {
  const DailyRoutine({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:DailyRoutinelistNotifire ,
      builder:(BuildContext ctx, List<DailyRoutineModel> DailyRoutinelist, Widget? child){
        final data =DailyRoutinelist.isNotEmpty ? DailyRoutinelist[0] : null;
       return  Column(
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
              child:  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                       'WAKE UP    :  ${data?.wakeUp}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                  'WORK OUT TIME :  ${data?.workoutTime }',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '      SLEEP   :  ${data?.sleep}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
      } ,
      
    );
  }
}
