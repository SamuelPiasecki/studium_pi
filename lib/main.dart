import 'package:flutter/material.dart';
import 'package:studium_pi/pages/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studium',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        accentColor: Colors.indigo[800],
        fontFamily: 'Rubik',
      ),
      home: Home(),
    );
  }
}
