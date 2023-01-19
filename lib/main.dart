import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_vet/api.dart';
import 'package:flutter_vet/login.dart';
import 'package:flutter_vet/maps.dart';
import 'package:flutter_vet/profile.dart';
import 'package:flutter_vet/reminder.dart';
import 'maps.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'switch.dart';
import 'choose.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/profile': (context) => Profile(),
      '/reminder': (context) => reminder(),
      '/MyApp': (context) => MyApp(),
      '/api': (context) => webApi(),
      '/choose': (context) => DropdownButtonApp(),
    },
  ));

  await AndroidAlarmManager.initialize();
}
