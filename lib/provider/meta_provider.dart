import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:studium_pi/model/meta.dart';

class MetaProvider extends ChangeNotifier {
  StreamSubscription<QuerySnapshot>? _metaSubscription;
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();
  CollectionReference metasCollection =
      FirebaseFirestore.instance.collection('Users');

  List<Meta> _metas = [];

  List<Meta> get metas => _metas.where((meta) => meta.isDone == false).toList();

  List<Meta> get metasCompletas =>
      _metas.where((meta) => meta.isDone == true).toList();

  void setMetas(List<Meta> metas) =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _metas = metas;

        notifyListeners();
      });

  Future<void> addMeta(Meta meta) {
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Metas');
    meta.id = colRef.doc().id;
    return colRef.doc(meta.id).set({
      'title': meta.title,
      'description': meta.description,
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'timestamp': DateTime.now().microsecondsSinceEpoch,
      'isDone': meta.isDone,
      'id': meta.id,
      'uid': FirebaseAuth.instance.currentUser!.uid
    });
  }

  void readMetas(Object? metas) {
    _metaSubscription = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Metas')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      _metas = [];
      snapshot.docs.forEach((document) {
        _metas.add(
          Meta(
              title: document.data()['title'],
              description: document.data()['description'],
              id: document.data()['id'],
              isDone: document.data()['isDone']),
        );
      });
      notifyListeners();
    });
  }

  Future<void> deleteMeta(Meta meta) {
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection('Metas');
    return colRef
        .doc(meta.id)
        .delete()
        .then((value) => print("Meta Deleted"))
        .catchError((error) => print("Failed to delete meta: $error"));
  }

  Future<void> updateMeta(Meta meta, String title, String description) {
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection('Metas');
    return colRef
        .doc(meta.id)
        .update({'title': title, 'description': description})
        .then((value) => print("Meta Updated"))
        .catchError((error) => print("Failed to update meta: $error"));
  }

  Future<void> toggleMetaStatus(Meta meta) {
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection('Metas');
    return colRef
        .doc(meta.id)
        .update({'isDone': !meta.isDone})
        .then((value) => print("Meta Updated"))
        .catchError((error) => print("Failed to update meta: $error"));
  }
}
