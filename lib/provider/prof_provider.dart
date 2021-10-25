import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:studium_pi/model/prof.dart';

class ProfProvider extends ChangeNotifier {
  StreamSubscription<QuerySnapshot>? _profSubscription;
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();
  CollectionReference profCollection =
      FirebaseFirestore.instance.collection('Users');

  List<Prof> _profs = [];

  List<Prof> get profs => _profs;

  Future<void> addProf(Prof prof) {
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Professores');
    prof.id = colRef.doc().id;
    return colRef.doc(prof.id).set({
      'nome': prof.nome,
      'email': prof.email,
      'disciplina': prof.disciplina,
      'telefone': prof.telefone,
      //'timestamp': DateTime.now().microsecondsSinceEpoch,
      'id': prof.id
    });
  }

  void readProf(Object? profs) {
    _profSubscription = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Professores')
        .orderBy('nome', descending: false)
        .snapshots()
        .listen((snapshot) {
      _profs = [];
      snapshot.docs.forEach((document) {
        _profs.add(
          Prof(
              nome: document.data()['nome'],
              email: document.data()['email'],
              disciplina: document.data()['disciplina'],
              telefone: document.data()['telefone'],
              id: document.data()['id']),
        );
      });
      notifyListeners();
    });
  }

  Future<void> deleteProf(Prof prof) {
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Professores');
    return colRef
        .doc(prof.id)
        .delete()
        .then((value) => print("Prof Deleted"))
        .catchError((error) => print("Failed to delete prof: $error"));
  }

  Future<void> updateProf(Prof prof, String nome, String email, String telefone,
      String disciplina) {
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Professores');
    return colRef
        .doc(prof.id)
        .update({
          'nome': nome,
          'email': email,
          'telefone': telefone,
          'disciplina': disciplina
        })
        .then((value) => print("Meta Updated"))
        .catchError((error) => print("Failed to update meta: $error"));
  }
}
