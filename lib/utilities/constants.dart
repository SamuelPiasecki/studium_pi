import 'package:flutter/material.dart';

final sHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'Rubik',
);

final sLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Rubik',
);

final sBoxDecorationStyle = BoxDecoration(
  border: Border(
      bottom: BorderSide(
    color: Colors.white,
    width: 2.0,
  )),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
