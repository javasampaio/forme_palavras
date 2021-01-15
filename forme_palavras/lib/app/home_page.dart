import 'package:flutter/material.dart';
import 'package:forme_palavras/widget/card_info_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),          
          child: CardInfoWidget(
            
          ),
        ),
      ),
    );
  }
}
