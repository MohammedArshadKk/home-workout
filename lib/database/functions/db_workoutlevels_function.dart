// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

ValueNotifier<List<HistoryLevels>> historyLevelsListNotifire = ValueNotifier([]);

Future<void> addWorkoutLevelsHistory(HistoryLevels value) async {
  final historyDb = await Hive.openBox('HistoryLevels_db');
  
  if (historyLevelsListNotifire.value.isEmpty) {
    final id = await historyDb.add(value); 
    value.id = id;
    historyLevelsListNotifire.value.add(value);
  } else {
    final firstItem = await historyDb.getAt(0) as HistoryLevels?;
    if (firstItem != null) {        
      firstItem.levels = (firstItem.levels ?? 0) + 1;
      historyDb.putAt(0, firstItem);
    } else {
      
      final id = await historyDb.add(value);
      value.id = id;
      historyLevelsListNotifire.value.add(value);
    }
  }
  
  historyLevelsListNotifire.notifyListeners();
}

Future<void> getAllLevelsHistory() async {
  final historyDb = await Hive.openBox('HistoryLevels_db');
  historyLevelsListNotifire.value.clear();
  historyLevelsListNotifire.value.addAll(historyDb.values.cast<HistoryLevels>());
  historyLevelsListNotifire.notifyListeners();
}
