import 'package:flutter/material.dart';
import 'package:forme_palavras/app/home_page.dart';

void main() => runApp(FormePalavrasApp());

class FormePalavrasApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forme Palavras',
      theme: ThemeData(       
        primarySwatch: Colors.blue,
        fontFamily: 'Games'
      ),
      home: HomePage(),
    );
  }
}
