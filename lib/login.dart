import 'dart:ffi';
import 'package:flutter_vet/Vet/vet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'profile.dart';
import 'maps.dart';
import 'package:permission_handler/permission_handler.dart';
import 'api.dart';
import 'package:translator/translator.dart';
import 'package:carousel_slider/carousel_slider.dart';

//import 'package:location/location.dart';
var bos;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

//DateTime dateTime = DateTime.now();
List<String> _availableTimezones = <String>[];
bool isMorning = true;
CarouselController buttonCarouselController = CarouselController();
Profile profile = Profile();
String night = "Good Night!";
String morning = "Good Morning!";
String afternoon = "Good Afternoon!";
int timestamp = DateTime.now().hour;
String? split;
String? value;

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final translator = GoogleTranslator();
    split = name.username;

    // value = split!.replaceAll('@gmail.com', ' ');
    value = split!.substring(0, split!.indexOf('@'));

    //String username = "Harun";
    // String isDayTime = isMorning ? 'Good Morning!' : 'Good Night!';
    // Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 10),
            SafeArea(
                child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value!.length < 20 ? 'Hi $value' : 'Hi user',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/prof.png'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text((DateTime.now().hour) > 18 &&
                                (DateTime.now().hour) < 07
                            ? '$night'
                            : '$afternoon')),
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
                              onPressed: () {
                                print(DateTime.now());
                                print(timestamp);
                              },
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
                  CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage("assets/dog.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage("assets/dog.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage("assets/dog.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/choose');
                          },
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
                          onPressed: () async {},
                          child: Icon(Icons.sick),
                          backgroundColor: Colors.orange[400],
                          heroTag: null,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
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
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
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
                                if (locationStatus ==
                                    PermissionStatus.granted) {
                                  mapUtils.openMap("veteriner");
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
      ),
    );
  }
}
