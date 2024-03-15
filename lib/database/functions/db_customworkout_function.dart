// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

ValueNotifier<List<CustomWorkoutModel>> historyCustomWorkoutListNotifire=ValueNotifier([]);
Future<void> addCustomWorkout(CustomWorkoutModel value)async{
  final customWorkoutdb= await Hive.openBox('CustomWorkout_db');
   final _id=await customWorkoutdb.add(value);
   value.id=_id;
 historyCustomWorkoutListNotifire.value.add(value);
 historyCustomWorkoutListNotifire.notifyListeners();
  print(value.toString());
}
Future<void>getAllCustomWorkout()async{
   final customWorkoutdb= await Hive.openBox('CustomWorkout_db');     
  historyCustomWorkoutListNotifire.value.clear();
  historyCustomWorkoutListNotifire.value.addAll(customWorkoutdb.values.cast<CustomWorkoutModel>());
   historyCustomWorkoutListNotifire.notifyListeners();
}
Future<void>deleteUserWorkout(int id)async{
  final customWorkoutdb=  await Hive.openBox('CustomWorkout_db');
  await customWorkoutdb.delete(id);
  getAllCustomWorkout();
}
