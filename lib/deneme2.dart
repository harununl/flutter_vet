import 'package:flutter/material.dart';

class deneme extends StatefulWidget {
  const deneme({super.key});

  @override
  State<deneme> createState() => _denemeState();
}

class _denemeState extends State<deneme> {
  bool _canPop = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_canPop) {
          return true;
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Alert"),
              content: Text("Are you sure you want to exit?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No"),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _canPop = true;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes"),
                ),
              ],
            ),
          );
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("WillPopScope Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'This route can be popped only if the condition is met.',
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _canPop = true;
                  });
                },
                child: Text("Set condition to true"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
