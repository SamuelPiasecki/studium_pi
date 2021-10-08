import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studium_pi/model/meta.dart';
import 'package:studium_pi/utilities/utils.dart';

class FirebaseApi {
  static Future<String> createMeta(Meta meta) async {
    final docMeta = FirebaseFirestore.instance.collection('meta').doc();

    meta.id = docMeta.id;
    await docMeta.set(meta.toJson());

    return docMeta.id;
  }

  static Stream<List<Meta>> readMetas() => FirebaseFirestore.instance
      .collection('todo')
      .orderBy(MetaField.createdTime, descending: true)
      .snapshots()
      .transform(
          Utils.transformer(Meta.fromJson as Function(Map<String, dynamic>?))
              as StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
                  List<Meta>>);
}
