// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

ValueNotifier<List<HistoryFullbody>> historyListFullbodyNotifire=ValueNotifier([]);
Future<void> addWorkoutFullbodyHistory(HistoryFullbody value)async{
  final historyDb= await Hive.openBox('HistoryFullbody_db');
 historyListFullbodyNotifire.value.add(value);
 historyListFullbodyNotifire.notifyListeners();
//  print(value.toString());
}
Future<void>getAllFullbodyHistory()async{
   final historyDb= await Hive.openBox('HistoryFullbody_db');
        
  historyListFullbodyNotifire.value.clear();
  historyListFullbodyNotifire.value.addAll(historyDb.values.cast<HistoryFullbody>());
   historyListFullbodyNotifire.notifyListeners();
}
Future<void> updateWorkoutFullbodyHistory(HistoryFullbody updatedValue) async {
  final historyDb = await Hive.openBox('HistoryFullbody_db');
   
    await historyDb.put(updatedValue.days, updatedValue);
    historyListFullbodyNotifire.notifyListeners();
}