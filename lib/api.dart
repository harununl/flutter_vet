import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vet/testparse.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'choose.dart';

Future<String> excuteSample() async {
  String split = newValue.value;

  String value = split.replaceAll(' ', '-');
  var url = Uri.parse('https://www.purina.com/dogs/dog-breeds/$value');
  var response = await http.get(url);

  BeautifulSoup bs = BeautifulSoup(response.body);
  final allHeaderName = bs.find('', attrs: {'class': 'statsDef-content-list'});
  // final secondHeader = bs.find('', attrs: {'class': 'statsDef-content-list'});

  final header = allHeaderName!.text;
  // final second = secondHeader!.text;
  //final arr = {header, second};
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return header;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load selected pet');
  }
}

class TestParse {
  final String title;

  const TestParse({
    required this.title,
  });

  // factory TestParse.fromJson(Map<String, dynamic> json) {
  //   return TestParse(
  //     title: json['script'],
  //   );
  // }
}

class webApi extends StatefulWidget {
  const webApi({super.key});

  @override
  State<webApi> createState() => _webApiState();
}

//TestParse test = new TestParse();

class _webApiState extends State<webApi> {
  @override
  void initState() {
    // TODO: implement initState
    excuteSample();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fetch data from website"),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: FutureBuilder<String>(
                  future: excuteSample(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.toString(),
                        style: TextStyle(fontSize: 17),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return CircularProgressIndicator();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
