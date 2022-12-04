import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_vet/toDo.dart';
import 'package:flutter_vet/todoItem.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:intl/intl.dart';

class reminder extends StatefulWidget {
  const reminder({super.key});

  @override
  State<reminder> createState() => _reminderState();
}

class _reminderState extends State<reminder> {
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
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
    return Container(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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

                          birthDateInString =
                              "${birthDate!.month}/${birthDate!.day}/${birthDate!.year}";
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
            height: 100,
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

  getTimeFromUser({required bool isStartTime}) {
    var pickedTime = _showTimePicker();
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
        initialTime: TimeOfDay(hour: 9, minute: 10));
  }
}
