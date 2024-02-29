
import 'package:hive_flutter/adapters.dart';

part 'database_model.g.dart';


@HiveType(typeId: 1)
class HistoryModel{
  @HiveField(0)
  int? id;
  @HiveField(1)
  final dynamic gif;

  @HiveField(2)
  final String? workOutName;

  @HiveField(3)                                               
  final String? duration;
 

  HistoryModel({required this.gif, required this.workOutName, required this.duration ,  this.id });
}


@HiveType(typeId: 2)
class HistoryFullbody{
  @HiveField(0)
  int? id;
  @HiveField(1)
  num? days;

  HistoryFullbody({required this.days ,this.id});
}
@HiveType(typeId: 3)
class BMImodel{
@HiveField(0)
int? id;
@HiveField(1)
final String weight;
@HiveField(2)
final String height;
@HiveField(3)
final String bmi;        
@HiveField(4)
final String health ;

  BMImodel({required this.weight, required this.height, required this.bmi, required this.health,this.id});

}
@HiveType(typeId: 4)
class HistoryLevels{
  @HiveField(0)
  int? id;
  @HiveField(1)
  num? levels;

  HistoryLevels({required this.levels ,this.id});
}
@HiveType(typeId: 5)
class DailyRoutineModel{
@HiveField(0)
int? id;
@HiveField(1)
final dynamic wakeUp;
@HiveField(2)
final dynamic workoutTime;
@HiveField(3)
final dynamic sleep;

  DailyRoutineModel({required this.wakeUp, required this.workoutTime, required this.sleep,this.id});

}