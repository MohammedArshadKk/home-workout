// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

ValueNotifier<List<HistoryFullbody>> historyFullBodyListNotifire = ValueNotifier([]);

Future<void> addWorkoutFullBodyHistory(HistoryFullbody value) async {
  final historyDb = await Hive.openBox('HistoryFullBdy_db');
  
  if (historyFullBodyListNotifire.value.isEmpty) {
    final id = await historyDb.add(value);
    value.id = id;
    historyFullBodyListNotifire.value.add(value);
  } else {
    final firstItem = await historyDb.getAt(0) as HistoryFullbody?;
    if (firstItem != null) {        
      firstItem.days = (firstItem.days ?? 0) + 1.1;
      historyDb.putAt(0, firstItem);
    } else {
      
      final id = await historyDb.add(value);
      value.id = id;
      historyFullBodyListNotifire.value.add(value);
    }
  }
  
  historyFullBodyListNotifire.notifyListeners();
}

Future<void> getAllFullBodyHistory() async {
  final historyDb = await Hive.openBox('HistoryFullBdy_db');
  historyFullBodyListNotifire.value.clear();
  historyFullBodyListNotifire.value.addAll(historyDb.values.cast<HistoryFullbody>());
  historyFullBodyListNotifire.notifyListeners();
}
