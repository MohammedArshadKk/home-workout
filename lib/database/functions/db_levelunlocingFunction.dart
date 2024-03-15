// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

ValueNotifier<List<LevelUnlockingModel>> levelListNotifire=ValueNotifier([]);
Future<void> addWorkoutlevelunloking(LevelUnlockingModel value)async{
  final levelDb= await Hive.openBox('Level_db');
   if (levelListNotifire.value.isEmpty) {
    final id = await levelDb.add(value);
    value.id = id;
    levelListNotifire.value.add(value);
    log("all values are here: ${levelDb.values}");
  }else{
    await levelDb.putAt(0,value);
  }
  print("all values are here: ${levelDb.values}");
  levelListNotifire.notifyListeners();
//  print(value.toString());
}
Future<void>getAlllevelsUnloked()async{
   final levelDb= await Hive.openBox('Level_db');     
  levelListNotifire.value.clear();
  levelListNotifire.value.addAll(levelDb.values.cast<LevelUnlockingModel>());
   levelListNotifire.notifyListeners();
}




