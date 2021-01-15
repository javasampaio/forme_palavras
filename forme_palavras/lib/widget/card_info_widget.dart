import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:forme_palavras/widget/painter/info_painter.dart';

class CardInfoWidget extends StatelessWidget {
  final double radius;
  final double border;
  final String text;
  final Color textColor;
  final double fontSize;
  final double padding;
  final VoidCallback callback;

  CardInfoWidget(
      {this.radius,
      this.border,
      this.text =
          'jhsadgjhgfkjd \n jkhykjhkhdfyyc \n hgfdhdhdhdhhdh \n hfjdjdjdjdjd \n gfgfgfgf \n hgdlkghkjhkdshfkjdshfkdshk',
      Key key,
      this.textColor,
      this.fontSize,
      this.padding = 15.0, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          CustomPaint(
            painter: InfoPainter(),
            child: Container(
              padding: EdgeInsets.only(
                  left: padding, bottom: padding, right: padding, top: 25),
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: fontSize),
              ),
            ),
          ),
          Positioned(
            right: -45,
            top: -25,
            child: RawMaterialButton(
              onPressed: callback,
              elevation: 2.0,
              child: Icon(
                Icons.close,
                size: 25,
              ),
              padding: EdgeInsets.all(8),
              shape: CircleBorder(),
              fillColor: Colors.lime,
            ),
          ),
        ],
      ),
    );
  }
}
