import 'package:flutter/material.dart';

import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 50,
        height: 70,
        child: TextTransition(
          controller: _controller,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class TextTransition extends AnimatedWidget {
  const TextTransition({Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.000)
        // ..rotateY(_progress.value * math.pi * 2.0)
        ..rotateX(_progress.value * math.pi * 2.0),
      // ..rotateZ(_progress.value * math.pi * 2.0),
      child: _progress.value >= 0.25 && _progress.value <= 0.75 ?  Container(
        color: Colors.orange,
        child: Text('A'),
      ) :  Container(
        color: Colors.orange,
        child: Icon(Icons.work),
      )
    );
  }
}
