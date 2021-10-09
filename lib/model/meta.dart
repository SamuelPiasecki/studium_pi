import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studium_pi/utilities/utils.dart';

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

  static Meta fromJson(Map<String, dynamic>? json) => Meta(
        createdTime: Utils.toDateTime(json!['createdTime']),
        title: json['title'],
        description: json['description'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'id': id,
        'idDone': isDone,
      };

  static StreamTransformer<QuerySnapshot<Map<String, dynamic>?>, List<T>>
      transformer<T>(T Function(Map<String, dynamic>? json) fromJson) =>
          StreamTransformer.fromHandlers(
            handleData: (QuerySnapshot<Map<String, dynamic>?> data,
                EventSink<List<T>> sink) {
              final snaps = data.docs.map((doc) => doc.data()).toList();
              final objects = snaps.map((json) => fromJson(json)).toList();

              sink.add(objects);
            },
          );
}
