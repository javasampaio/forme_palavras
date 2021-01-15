import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forme_palavras/core/colors/app_colors.dart';

class InfoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final startPath = 20.0;
    final roundedCorner = 6.0;
    final sizeMultiply = 1;

    final shadowStroke = 5.0;
    final outShadowBlur = 5.0;

    final borderStartPath = 22.0;
    final borderMoveTo = 2.0;
    
    final mainPaint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    final mainPath = Path();
    mainPath.moveTo(0, startPath - 2.1);
    mainPath.lineTo(0, size.height * sizeMultiply - roundedCorner);
    mainPath.quadraticBezierTo(0, size.height * sizeMultiply, roundedCorner, size.height * sizeMultiply);
    mainPath.lineTo(size.width * sizeMultiply - roundedCorner, size.height * sizeMultiply);
    mainPath.quadraticBezierTo(
        size.width * sizeMultiply, size.height * sizeMultiply, size.width * sizeMultiply, size.height * sizeMultiply - roundedCorner);
    //path.quadraticBezierTo(size.width * 2, 0, size.width * 2, 10);
    mainPath.lineTo(size.width * sizeMultiply, 0);
    //mainPath.lineTo(0, startPath);
    //path.addRRect(rrectBorder);

    final outShadowPaint = Paint()
      ..strokeWidth = shadowStroke
      ..color = AppColors.borderShadowColor
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, outShadowBlur);

    canvas.drawPath(mainPath, outShadowPaint);

    canvas.drawPath(mainPath, mainPaint);

    final paintBorder = Paint()
      ..color = Colors.lightBlue
      ..strokeWidth = shadowStroke
      ..style = PaintingStyle.stroke;

    

    final borderPath = Path();
    borderPath.moveTo(borderMoveTo, borderStartPath);
    borderPath.lineTo(borderMoveTo, size.height * sizeMultiply - roundedCorner);
    borderPath.quadraticBezierTo(2, size.height * sizeMultiply - 2, roundedCorner, size.height * sizeMultiply - 2);
    borderPath.lineTo(size.width * sizeMultiply, size.height * sizeMultiply - 2);
    borderPath.quadraticBezierTo(
        size.width * sizeMultiply - 2, size.height * sizeMultiply - 2, size.width * sizeMultiply - 2, size.height * sizeMultiply - roundedCorner);
    //path.quadraticBezierTo(size.width * 2, 0, size.width * 2, 10);
    borderPath.lineTo(size.width * sizeMultiply - 2, 3);
    //borderPath.lineTo(2, borderStartPath);

     final inShadowPaint = Paint()
      ..strokeWidth = 2.0
      ..color = AppColors.borderShadowColor
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3);
      canvas.drawPath(borderPath, inShadowPaint);

      canvas.drawPath(mainPath, paintBorder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
