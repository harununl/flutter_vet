import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

import 'package:flutter_vet/login.dart';
import 'package:flutter_vet/maps.dart';
import 'package:flutter_vet/profile.dart';
import 'package:flutter_vet/reminder.dart';
import 'maps.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'switch.dart';

void main() async {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/profile': (context) => Profile(),
      '/reminder': (context) => reminder(),
      '/MyApp': (context) => MyApp(),
    },
  ));
  await AndroidAlarmManager.initialize();
}
