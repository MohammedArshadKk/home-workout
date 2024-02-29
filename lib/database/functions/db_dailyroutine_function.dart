// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

ValueNotifier<List<DailyRoutineModel>> DailyRoutinelistNotifire = ValueNotifier([]);

Future<void> adddailyRoutineDetails(DailyRoutineModel value) async {
  final dailyRoutine = await Hive.openBox('DailyRoutine_db');
  
  if (DailyRoutinelistNotifire.value.isEmpty) {
    final id = await dailyRoutine.add(value);
    value.id = id;
    DailyRoutinelistNotifire.value.add(value);
    log("all values are here: ${dailyRoutine.values}");
  }else{
    await dailyRoutine.putAt(0, value);
  }
  print("all values are here: ${dailyRoutine.values}");
  DailyRoutinelistNotifire.notifyListeners();
}

Future<void> getAlldailyRoutineDetails() async {
  final dailyRoutine = await Hive.openBox('DailyRoutine_db');
  DailyRoutinelistNotifire.value.clear();
  DailyRoutinelistNotifire.value.addAll(dailyRoutine.values.cast<DailyRoutineModel>());
  DailyRoutinelistNotifire.notifyListeners();
}
