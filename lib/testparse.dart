import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

Future<TestParse> excuteSample() async {
  var url = Uri.parse('https://www.purina.com/dogs/dog-breeds/affenpinscher');
  var response = await http.get(url);
  BeautifulSoup bs = BeautifulSoup(response.body);
  final allHeaderName =
      bs.findAll('', attrs: {'class': 'statsDef-content-list-hd'});
  allHeaderName.forEach((element) {
    print('the header: ${element.text}');
  });

  throw Exception('Failed to load album');
}

class TestParse {
  final String title;

  const TestParse({
    required this.title,
  });

  factory TestParse.fromJson(Map<String, dynamic> json) {
    return TestParse(
      title: json['title'],
    );
  }
}
