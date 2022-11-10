import 'package:flutter/material.dart';

import 'package:flutter_vet/login.dart';
import 'package:flutter_vet/maps.dart';
import 'package:flutter_vet/profile.dart';
import 'maps.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/profile': (context) => Profile(),
      '/maps': (context) => Maps(),
    },
  ));
}
