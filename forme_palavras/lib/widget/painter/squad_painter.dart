
import 'package:flutter/material.dart';
import 'package:forme_palavras/core/colors/app_colors.dart';

class SquadPainter extends CustomPainter {
  final double radius;
  final double border;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;

  SquadPainter(this.radius, this.border, {this.backgroundColor = AppColors.backgroundColor, this.borderColor = AppColors.borderColor, this.shadowColor = AppColors.borderShadowColor});

  @override
  void paint(Canvas canvas, Size size) {
    final rrectBorder =
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius));

    final s = Size(size.width - border, size.height - border);
    final rrectShadow = RRect.fromRectAndRadius(
        Offset(border / 2, border / 2) & s,
        Radius.circular(radius));

    final shadowPaint = Paint()
      ..strokeWidth = border
      ..color = shadowColor
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2);
      
    final borderPaint = Paint()
      ..strokeWidth = border
      ..color = borderColor
      ..style = PaintingStyle.stroke;

      final backgroundPaint = Paint()
      ..color = backgroundColor;

    canvas.drawRRect(rrectBorder, backgroundPaint);
    canvas.drawRRect(rrectShadow, shadowPaint);
    canvas.drawRRect(rrectBorder, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}