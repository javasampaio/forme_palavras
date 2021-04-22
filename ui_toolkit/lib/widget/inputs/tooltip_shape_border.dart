import 'package:flutter/material.dart';

class TooltipShapeBorder extends ShapeBorder {
  const TooltipShapeBorder(
      {this.radius = 16.0,
      this.arrowWidth = 20.0,
      this.arrowHeight = 10.0,
      this.arrowArc = 0.0,
      this.showUp = false})
      : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  final double arrowWidth;
  final double arrowHeight;
  final double arrowArc;
  final double radius;
  final bool showUp;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    rect = Rect.fromPoints(rect.topLeft + Offset(0, arrowHeight),
        rect.bottomRight - Offset(0, arrowHeight + 5));
    final double x = arrowWidth, y = arrowHeight, r = 1 - arrowArc;
    if (showUp) {
      return Path()
        ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
        ..moveTo(rect.bottomRight.dx - x / 1.5, rect.bottomCenter.dy)
        ..relativeLineTo(-x / 2 * r, y * r)
        ..relativeLineTo(-x / 2, -y * r);
    }
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
      ..moveTo(rect.topRight.dx - x / 1.5, rect.topCenter.dy)
      ..relativeLineTo(-x / 2 * r, -y * r)
      ..relativeLineTo(-x / 2, y * r);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
