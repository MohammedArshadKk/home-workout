// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

ValueNotifier<List<BMImodel>> bmiNotifire = ValueNotifier([]);

Future<void> addBmiDetails(BMImodel value) async {
  final bmiDb = await Hive.openBox('bmi_db');
  
  if (bmiNotifire.value.isEmpty) {
    final id = await bmiDb.add(value);
    value.id = id;
    bmiNotifire.value.add(value);
    print("all values are here: ${bmiDb.values}");
  }else{
    await bmiDb.putAt(0, value);
  }
  print("all values are here: ${bmiDb.values}");
  bmiNotifire.notifyListeners();
}

Future<void> getAllBmiDetails() async {
  final bmiDb = await Hive.openBox('bmi_db');
  bmiNotifire.value.clear();
  bmiNotifire.value.addAll(bmiDb.values.cast<BMImodel>());
  bmiNotifire.notifyListeners();
}


