import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sdfsdfsdf")),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {});
            }, // Handle your callback.
            splashColor: Colors.brown.withOpacity(0.5),
            child: Ink(
              height: 360,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/001/200/028/original/dog-png.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              setState(() {});
            }, // Handle your callback.
            splashColor: Colors.brown.withOpacity(0.5),
            child: Ink(
              height: 360,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.pngitem.com/pimgs/m/463-4638697_png-cat-funny-icon-14-cartoon-cat-png.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
