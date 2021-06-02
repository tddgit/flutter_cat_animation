import 'package:flutter/material.dart';
import 'package:flutter_cat_animation/screens/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Animation of Cat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home());
  }
}
