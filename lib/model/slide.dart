import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide(
      {
        required this.imageUrl,
        required this.title,
        required this.description});
}

final slideList = [
  Slide(
      imageUrl: 'Images/cat&dog (2).png',
      title: 'Welcome!',
      description: 'Hello There petime user! You can find anything you desire via this app.'


  ),
  Slide(
      imageUrl: 'Images/cat1.png',
      title: 'I love your care ',
      description: 'I know I am loved when you give me my favorite food. Just take a look and learn my favorites'
  ),
  Slide(
      imageUrl: 'Images/dog5.png',
      title: 'Make our relationship well',
      description: 'I feel your all senses,now its your turn. Check the list to know me better!'
  ),
];