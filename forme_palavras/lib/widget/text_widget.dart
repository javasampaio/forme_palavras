import 'package:flutter/material.dart';
import 'package:forme_palavras/widget/animation/text_animation.dart';

class TextWidget extends StatefulWidget {
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> with TickerProviderStateMixin{
  AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this)
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {    
    return Container(
      padding: EdgeInsets.all(6),
      width: 56,
      height: 76,
      child: TextTransition(
        controller: _controller,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
