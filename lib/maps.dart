import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLocation = LatLng(25.1193, 55.3773);

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  static const double _defaultLat = 41.0039437;
  static const double _defaultLng = 28.6921511;

  static const CameraPosition _defaultLocation =
      CameraPosition(target: LatLng(_defaultLat, _defaultLng), zoom: 15);
  // Completer<GoogleMapController> _controller = Completer();
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(25.1193, 55.3773),
  //   zoom: 14.4746,
  // );
  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _defaultLocation,
          ),
          // Container(
          //   padding: EdgeInsets.only(right: 20),
          //   alignment: Alignment.topRight,
          //   child: Column(
          //     children: [
          //       FloatingActionButton(
          //         onPressed: () {},
          //         child: Icon(
          //           Icons.map,
          //           size: 30,
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
      // body: GoogleMap(
      //   mapType: MapType.hybrid,
      //   initialCameraPosition: _kLake,
      //   onMapCreated: (map) {},
      //   // onMapCreated: (GoogleMapController controller) {
      //   //   _controller.complete(controller);
      //   // },
      // ),
    );
  }
}
