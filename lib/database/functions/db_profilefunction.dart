// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

ValueNotifier<List<ProfileModel>> profileModelistNotifire = ValueNotifier([]);

Future<void> addprofile(ProfileModel value) async {
  final profile = await Hive.openBox('profile_db');
  
  if (profileModelistNotifire.value.isEmpty) {
    final id = await profile.add(value);
    value.id = id;
    profileModelistNotifire.value.add(value);
    log("all values are here: ${profile.values}");
  }else{
    await profile.putAt(0, value);
  }
  print("all values are here: ${profile.values}");
  profileModelistNotifire.notifyListeners();
}

Future<void> getAllprofile() async {
  final profile = await Hive.openBox('profile_db');
  profileModelistNotifire.value.clear();
  profileModelistNotifire.value.addAll(profile.values.cast<ProfileModel>());
  profileModelistNotifire.notifyListeners();
}
