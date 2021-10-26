import 'package:flutter/material.dart';

class Event {
  String title;
  String description;
  DateTime from;
  DateTime to;
  Color backgroundColor;
  String id;

  Event(
      {required this.title,
      required this.description,
      required this.from,
      required this.to,
      this.backgroundColor = Colors.lightGreen,
      required this.id});
}
