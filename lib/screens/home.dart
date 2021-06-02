import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cat_animation/widgets/cat.dart';

/// Entry screen of the app - Home screen
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  /// Describes type of animation of the Cat
  Animation<double>? catAnimation;

  /// Controller for animation of the Cat
  AnimationController? catController;

  /// Describes type of animation of the Box
  Animation<double>? boxAnimation;

  /// Controller for animation of the Box
  AnimationController? boxController;

  @override
  void initState() {
    super.initState();

    boxController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    boxAnimation = Tween<double>(
      begin: 0,
      end: 3.14,
    ).animate(
      CurvedAnimation(
        parent: boxController!,
        curve: Curves.linear,
      ),
    );

    catController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    catAnimation = Tween<double>(begin: 90, end: 190).animate(
      CurvedAnimation(
        parent: catController!,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
            ],
          ),
        ),
      ),
    );
  }

  /// Return rotated on 120 degrees left flap of box
  Widget buildLeftFlap() {
    return Positioned(
      left: 3,
      top: 3,
      child: Transform.rotate(
        angle: pi / 2 + pi / 12,
        alignment: Alignment.topLeft,
        child: Container(
          height: 10,
          width: 125,
          color: Colors.brown,
        ),
      ),
    );
  }

  ///Returns animations of the cat
  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation!,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          bottom: catAnimation!.value,
          right: 0,
          left: 0,
          child: child!,
        );
      },
      child: Cat(),
    );
  }

  Widget buildBox() {
    return Container(
      height: 200,
      width: 200,
      color: Colors.brown,
    );
  }

  ///When the user tap on the box animation begins
  void onTap() {
    if (catController!.status == AnimationStatus.completed) {
      catController!.reverse();
      //The animation is stopped at the beginning.
    } else if (catController!.status == AnimationStatus.dismissed) {
      catController!.forward();
    }
  }

  //============================DEBUG SECTION================================
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty<Animation<double>>('catAnimation', catAnimation))
      ..add(DiagnosticsProperty<AnimationController>(
          'catController', catController))
      ..add(
          DiagnosticsProperty<Animation<double>?>('boxAnimation', boxAnimation))
      ..add(DiagnosticsProperty<AnimationController?>(
          'boxController', boxController));
  }
}
