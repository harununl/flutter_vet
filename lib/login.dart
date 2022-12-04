import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'profile.dart';
import 'maps.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:location/location.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// enum PermissionGroup {

//   /// Android: Fine and Coarse Location
//   /// iOS: CoreLocation - Always
//   locationAlways,

//   /// Android: Fine and Coarse Location
//   /// iOS: CoreLocation - WhenInUse
//   locationWhenInUse
// }

String username = "Harun";
// DateTime newDate = DateTime.now();
// DateTime now = DateTime.now();
// String formattedTime = DateFormat.Hms().format(DateTime.now());
// // dynamic currentTime = DateFormat.jm().format(DateTime.now().hour);
// bool isMorning =
//     int.parse(formattedTime) > 6 && int.parse(formattedTime) < 20.00
//         ? true
//         : false;

bool isMorning = true;
//String isDayTime = isMorning ? 'Good Morning!' : 'Good Night!';
Profile profile = Profile();
String night = "Good Night!";
String morning = "Good Morning!";
int timestamp = DateTime.now().hour;

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
              child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        "Hi ${username}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 240, top: 25),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/prof.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          (timestamp + 3) > 18 ? '${night}' : '${morning}')),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.orange[400],
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 20),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(13, 30, 10, 30),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Join our Pet Lover",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Community",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {},
                            child: Text(
                              "Soon",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 250, top: 10),
                        child: InkWell(
                          child: Text("See all",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[600])),
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.pets),
                        backgroundColor: Colors.orange[400],
                        heroTag: null,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.dining_rounded),
                        backgroundColor: Colors.orange[400],
                        heroTag: null,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/reminder');
                        },
                        child: Icon(Icons.info),
                        backgroundColor: Colors.orange[400],
                        heroTag: null,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.sick),
                        backgroundColor: Colors.orange[400],
                        heroTag: null,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(
                        "Nearby Veterinary",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.orange[100],
                  margin: EdgeInsets.fromLTRB(60, 10, 60, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(13, 30, 10, 30),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              "See near Veterinary",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () async {
                              // Navigator.pushNamed(context, '/maps');
                              PermissionStatus locationStatus =
                                  await Permission.location.request();
                              if (locationStatus == PermissionStatus.granted) {
                                mapUtils.openMap("Veteriner");
                              } else if (locationStatus ==
                                  PermissionStatus.denied) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "This permission is recommended")));
                              }
                            },
                            child: Text("Show on Maps"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
