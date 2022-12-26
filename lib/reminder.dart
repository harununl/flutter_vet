import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_vet/toDo.dart';
import 'package:flutter_vet/todoItem.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:intl/intl.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class reminder extends StatefulWidget {
  const reminder({super.key});

  @override
  State<reminder> createState() => _reminderState();
}

class _reminderState extends State<reminder> {
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  int selectedRemind = 5;
  String selectedRepeat = "None";
  List<String> repeatList = ["Daily", "Weekly", "Monthly"];
  List<int> remindList = [5, 10, 15, 20];
  final todosList = ToDo.todoList();
  final toDoController = TextEditingController();
  int alarmId = 1;
  bool isOn = false;

  bool isDateSelected = false;
  DateTime? birthDate; // instance of DateTime
  String birthDateInString = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Reminder",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange[400],
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                context: context,
                builder: (builder) => bottomSheet());
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.orange[400],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All Reminders",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            for (ToDo toDo in todosList)
              ToDoItem(
                toDo: toDo,
                onToDoChanged: handleToDoChange,
              ),
          ],
        ));
  }

  Widget bottomSheet() {
    return ListView(
      children: [
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: toDoController,
                  decoration: InputDecoration(labelText: "Enter your reminder"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      "Set your reminder date:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.orange, spreadRadius: 3),
                        ],
                      ),
                      child: Text(
                        "${birthDateInString}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        child: new Icon(Icons.calendar_today),
                        onTap: () async {
                          final datePick = await showDatePicker(
                              context: context,
                              initialDate: new DateTime.now(),
                              firstDate: new DateTime(1900),
                              lastDate: new DateTime(2100));
                          if (datePick != null && datePick != birthDate) {
                            setState(() {
                              birthDate = datePick;
                              isDateSelected = true;

                              birthDateInString = "${birthDate!.day}";
                            });
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 230),
                child: Text(
                  "Set your reminder time:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 250),
                child: TextField(
                  onTap: () {
                    getTimeFromUser(isStartTime: true);
                  },
                  //controller: timeinput, //editing controller of this TextField
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.access_time_rounded),
                    labelText: _startTime,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 3.0),
                    ), //label text of field
                  ),
                  readOnly: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Repeat",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${selectedRepeat}"),
                  ),
                  DropdownButton<String>(
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                    ),
                    onChanged: (String? newValue) {
                      // This is called when the user selects an item.
                      setState(() {
                        selectedRepeat = newValue!;
                      });
                    },
                    items: repeatList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    setState(() {
                      if (toDoController.text != "") {
                        var dateTimeString = birthDateInString;
                        AwesomeNotifications().createNotification(
                            content: NotificationContent(
                                id: 10,
                                channelKey: 'basic_channel',
                                title: 'Cat Vaccine',
                                body: toDoController.text,
                                actionType: ActionType.Default),
                            schedule: NotificationCalendar(
                                hour: int.parse(_startTime.split(":")[0]),
                                minute: int.parse(
                                    _startTime.split(":")[1].split(" ")[0]),
                                day: int.parse(dateTimeString),
                                repeats: true));

                        addToDoItem(toDoController.text);
                      }
                    });

                    AndroidAlarmManager.oneShot(
                        Duration(seconds: 1), alarmId, fireAlarm);

                    //print("your alarm has been set");
                  },
                  child: Text("Create Reminder"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void handleToDoChange(ToDo toDo, String id) {
    setState(() {
      if (toDo.isDone = !toDo.isDone) {
        todosList.removeWhere((item) => item.id == id);
      }
    });
  }

  void addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    toDoController.clear();
  }

  void fireAlarm() {
    print('alarm fired at${DateTime.now()}');
  }

  getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formattedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("time cancelled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formattedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }
}
