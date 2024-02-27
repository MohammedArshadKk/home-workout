// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

ValueNotifier<List<HistoryModel>> historyListNotifire=ValueNotifier([]);
Future<void> addWorkoutHistory(HistoryModel value)async{
  final historyDb= await Hive.openBox('History_db');
   final _id=await historyDb.add(value);
   value.id=_id;
 historyListNotifire.value.add(value);
 historyListNotifire.notifyListeners();
//  print(value.toString());
}
Future<void>getAllHistory()async{
   final historyDb= await Hive.openBox('History_db');     
  historyListNotifire.value.clear();
  historyListNotifire.value.addAll(historyDb.values.cast<HistoryModel>());
   historyListNotifire.notifyListeners();
}
 Future<void>deleteHistory(int id)async{
  final historyDb= await Hive.openBox('History_db');
  await historyDb.delete(id);
  print('fffff$id');
  getAllHistory();
 }


