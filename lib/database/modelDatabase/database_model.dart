import 'package:hive_flutter/adapters.dart';

part 'database_model.g.dart';

@HiveType(typeId: 1)
class HistoryModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final dynamic gif;

  @HiveField(2)
  final String? workOutName;

  @HiveField(3)
  final String? duration;
  @HiveField(4)
  final String dateAndTime;

  HistoryModel(
      {required this.gif,
      required this.workOutName,
      required this.duration,
      required this.dateAndTime,
      this.id});
}

@HiveType(typeId: 2)
class HistoryFullbody {
  @HiveField(0)
  int? id;
  @HiveField(1)
  num? days;

  HistoryFullbody({required this.days, this.id});
}

@HiveType(typeId: 3)
class BMImodel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String weight;
  @HiveField(2)
  final String height;
  @HiveField(3)
  final String bmi;
  @HiveField(4)
  final String health;

  BMImodel(
      {required this.weight,
      required this.height,
      required this.bmi,
      required this.health,
      this.id});
}

@HiveType(typeId: 4)
class HistoryLevels {
  @HiveField(0)
  int? id;
  @HiveField(1)
  num? levels;

  HistoryLevels({required this.levels, this.id});
}

@HiveType(typeId: 5)
class DailyRoutineModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final dynamic wakeUp;
  @HiveField(2)
  final dynamic workoutTime;
  @HiveField(3)
  final dynamic sleep;

  DailyRoutineModel(
      {required this.wakeUp,
      required this.workoutTime,
      required this.sleep,
      this.id});
}

@HiveType(typeId: 6)
class CustomWorkoutModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final dynamic gif;

  @HiveField(2)
  final String? workOutName;

  @HiveField(3)
  final String? duration;
  @HiveField(4)
  final String dicreption;

  CustomWorkoutModel(
      {required this.gif,
      required this.workOutName,
      required this.duration,
      required this.dicreption,
      this.id});
}

@HiveType(typeId: 7)
class ProfileModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final dynamic profile;
  ProfileModel({required this.profile});
}

@HiveType(typeId: 8)
class LevelUnlockingModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int day;
  LevelUnlockingModel({required this.day, this.id});
}
