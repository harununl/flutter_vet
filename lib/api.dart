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
import 'package:path/path.dart';
import 'package:google_translator/google_translator.dart';
import 'package:translator/translator.dart';

String? split;
String? image;
String? value;

Future<String> excuteSample() async {
  split = newValue.value;

  String pet = newValue.pet;

  value = split!.replaceAll(' ', '-');

  image = value!.toLowerCase();
  var url = Uri.parse('https://www.purina.com/${pet}s/$pet-breeds/$value');
  var response = await http.get(url);

  BeautifulSoup bs = BeautifulSoup(response.body);
  final allHeaderName = bs.find('', attrs: {'class': 'statsDef-content-list'});

  try {
    final header = allHeaderName!.text;

    if (response.statusCode == 200) {}

    return header;
  } catch (e) {
    print(e);
  }
  throw Exception('Failed to load selected pet');
}

Future<String> excuteInfo() async {
  split = newValue.value;
  //image = split!.replaceAll(' ', '');
  String pet = newValue.pet;

  value = split!.replaceAll(' ', '-');

  image = value!.toLowerCase();

  var urlForinfo =
      Uri.parse('https://www.purina.com/${pet}s/$pet-breeds/$value');
  var responseForinfo = await http.get(urlForinfo);

  BeautifulSoup intro = BeautifulSoup(responseForinfo.body);

  var introText = intro.find('', attrs: {'class': 'introText'});
  if (introText == null) {
    introText = intro.find('', attrs: {'class': 'quarantine'});
  }

  try {
    final intro = introText!.text;

    if (responseForinfo.statusCode == 200) {}

    return intro;
  } catch (e) {
    print(e);
  }
  throw Exception('Failed to load selected pet');
}

class TestParse {
  final String title;

  const TestParse({
    required this.title,
  });
}

class webApi extends StatefulWidget {
  const webApi({super.key});

  @override
  State<webApi> createState() => _webApiState();
}

final String apiKey = "AIzaSyDUAUTLQmBEr_eYDZteNhZOxCgSrrYKBlU";
final translator = GoogleTranslator();
String input = "hello";

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
        title: Text("Find your pet"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: ListView(children: [
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.center,
          child: Image.network(
            "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/${image}-detail.jpg?&width=240",
            height: 150,
            width: 150,
            fit: BoxFit.fitWidth,
          ),
        ),
        FutureBuilder<String>(
            future: excuteSample(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    snapshot.data!,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return LinearProgressIndicator();
            }),
        TextButton(
          onPressed: () {
            setState(() {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0),
                    ),
                  ),
                  child: Center(
                    child: InfoWidget(),
                  ),
                ),
              );
            });
          },
          child: Container(
            color: Colors.orange,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'More about ${value}',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        )
      ]),
    );
  }
}

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: ListView(children: [
            Center(
                child: Text(
              "Did You Know That?",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<String>(
                future: excuteInfo(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!.toString(),
                      style: TextStyle(fontSize: 17, letterSpacing: 1),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return LinearProgressIndicator();
                }),
          ]),
        ),
      ),
    );
  }
}
