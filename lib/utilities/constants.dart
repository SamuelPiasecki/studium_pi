import 'package:flutter/material.dart';

final sHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'Rubik',
);

final sLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'Rubik',
    fontSize: 18);

final sBoxDecorationStyle = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final colorBackgroundApp = Colors.white;
//Colors.grey[800];
final colorAppBar = Colors.indigo[800];

final buttonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.all(10.0),
  elevation: 5.0,
  primary: Colors.white,
  onPrimary: Colors.indigo[300],
);

final textStyleButton = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
