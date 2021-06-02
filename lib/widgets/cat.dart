import 'package:flutter/material.dart';

/// Widget with cat picture
class Cat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget img;
    try {
      img = Image.network(
        'https://imgur.com/QwhZRyL.png',
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      img = Text('Failed to load image of the cat $e');
    }
    return img;
  }
}
