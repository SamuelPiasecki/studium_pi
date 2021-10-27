import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/model/disciplina.dart';

class DiscProvider extends ChangeNotifier {
  StreamSubscription<QuerySnapshot>? _discSubscription;
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  List<Disciplina> _disciplinas = [];

  List<Disciplina> get disciplinas => _disciplinas;

  @override
  void dispose() {
    _discSubscription!.cancel();
    super.dispose();
  }

  Future<void> addDisc(Disciplina disc) {
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Disciplinas');
    disc.id = colRef.doc().id;
    return colRef.doc(disc.id).set({
      'nome': disc.nome,
      'startTime': disc.startTime.toString(),
      'endTime': disc.endTime.toString(),
      'weekDays': disc.weekDays,
      'id': disc.id
    });
  }

  void readDisc(Object? discs) {
    _discSubscription = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Disciplinas')
        .orderBy('nome', descending: false)
        .snapshots()
        .listen((snapshot) {
      _disciplinas = [];
      snapshot.docs.forEach((document) {
        _disciplinas.add(
          Disciplina(
              nome: document.data()['nome'],
              startTime: DateTime.parse(document.data()['startTime']),
              endTime: DateTime.parse(document.data()['endTime']),
              weekDays: List.from(document.data()['weekDays']),
              id: document.data()['id']),
        );
      });
      notifyListeners();
    });
  }

  Future<void> deleteDisc(Disciplina disc) {
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Disciplinas');
    return colRef
        .doc(disc.id)
        .delete()
        .then((value) => print("Disciplina Deleteda"))
        .catchError((error) => print("Failed to delete disciplina: $error"));
  }

  Future<void> updateDisc(Disciplina newDisc, Disciplina oldDisc) {
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Disciplinas');
    return colRef
        .doc(oldDisc.id)
        .update({
          'nome': newDisc.nome,
          'startTime': newDisc.startTime.toString(),
          'endTime': newDisc.endTime.toString(),
          'weekDays': newDisc.weekDays,
        })
        .then((value) => print("Disciplina Updated"))
        .catchError((error) => print("Failed to update disciplina: $error"));
  }
}
