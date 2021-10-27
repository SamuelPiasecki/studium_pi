import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/model/event.dart';

class EventProvider extends ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events => _events;

  DateTime _selectedDate = DateTime.now();
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Event> get eventsOfSelectedDate => _events;

  StreamSubscription<QuerySnapshot>? _eventoSubscription;

  void readEventos(Object? eventos) {
    _eventoSubscription = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Eventos')
        .snapshots()
        .listen((snapshot) {
      _events = [];
      snapshot.docs.forEach((document) {
        _events.add(Event(
            title: document.data()['title'],
            description: document.data()['description'],
            id: document.data()['id'],
            to: DateTime.parse(document.data()['to']),
            from: DateTime.parse(document.data()['from']),
            backgroundColor: Colors.lightGreen));
      });
      notifyListeners();
    });
  }

  Future<void> addEvent(Event event) {
    //_events.add(event);
    //notifyListeners();
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Eventos');
    event.id = colRef.doc().id;
    return colRef.doc(event.id).set({
      'title': event.title,
      'description': event.description,
      'to': event.to.toString(),
      'from': event.from.toString(),
      'id': event.id,
    });
  }

  Future<void> deleteEvent(Event event) {
    //_events.remove(event);
    //notifyListeners();
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Eventos');
    return colRef
        .doc(event.id)
        .delete()
        .then((value) => print("Event Deleted"))
        .catchError((error) => print("Failed to delete event: $error"));
  }

  Future<void> updateEvent(Event newEvent, Event oldEvent) {
    //final index = _events.indexOf(oldEvent);
    //_events[index] = newEvent;
    notifyListeners();
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Eventos');
    return colRef
        .doc(oldEvent.id)
        .update({
          'title': newEvent.title,
          'description': newEvent.description,
          'to': newEvent.to.toString(),
          'from': newEvent.from.toString()
        })
        .then((value) => print("Event Updated"))
        .catchError((error) => print("Failed to update event: $error"));
  }
}
