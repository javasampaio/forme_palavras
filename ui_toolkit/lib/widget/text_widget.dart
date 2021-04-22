import 'package:flutter/material.dart';
import 'package:ui_toolkit/widget/animation/text_animation.dart';

class TextWidget extends StatefulWidget {

  final int animationSeconds;

  TextWidget({this.animationSeconds = 10});

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> with TickerProviderStateMixin{
  AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: widget.animationSeconds), vsync: this)
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
