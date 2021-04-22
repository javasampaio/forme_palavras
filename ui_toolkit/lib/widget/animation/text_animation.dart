import 'package:flutter/material.dart';

import 'dart:math' as math;

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
      child: _progress.value >= 0.25 && _progress.value <= 0.75
          ? GestureDetector(
              onTap: () => {print('NOK')},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            )
          : GestureDetector(
              onTap: () => {print('OK')},
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(width: 1, color: Colors.blueGrey),
                ),
                child: Center(
                  child: Text(
                    'A',
                    style: TextStyle(fontSize: 45, fontFamily: 'Games'),
                  ),
                ),
              ),
            ),
    );
  }
}
