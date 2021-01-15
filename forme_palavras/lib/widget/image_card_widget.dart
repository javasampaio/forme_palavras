import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:forme_palavras/widget/painter/squad_painter.dart';

class CardWidget extends StatelessWidget {
  final double radius;
  final double border;
  final String text;
  final Color textColor;
  final double fontSize;
  final double padding;

  CardWidget(this.radius, this.border, this.text,
      {Key key, this.textColor, this.fontSize, this.padding = 15.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: SquadPainter(radius, border),
        child: Container(
          padding: EdgeInsets.all(padding),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
