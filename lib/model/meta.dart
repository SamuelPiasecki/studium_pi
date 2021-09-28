import 'package:flutter/cupertino.dart';

class MetaField {
  static const createdTime = 'createdTime';
}

class Meta {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Meta({
    required this.createdTime,
    required this.title,
    this.description = '',
    required this.id,
    this.isDone = false,
  });
}
