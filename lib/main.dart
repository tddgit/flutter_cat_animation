import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cat_animation/my_app.dart';

void main() {
  //Causes each RenderBox to paint a box around its bounds, and some extra
  // boxes, such as RenderPadding, to draw construction lines.
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}
