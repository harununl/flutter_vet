import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapUtils {
  mapUtils._();

  static Future<void> openMap(
    String destination,
  ) async {
    String googleMapUrl = "google.navigation:q=$destination&mode=c";

    if (await canLaunchUrl(Uri.parse(googleMapUrl))) {
      await launchUrl(Uri.parse(googleMapUrl));
    } else {
      throw 'could not open the map';
    }
  }
}
