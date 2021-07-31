import 'package:flutter/material.dart';

class Evento extends StatefulWidget {
  @override
  _EventoState createState() => _EventoState();
}

class _EventoState extends State<Evento> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Eventos'),
      centerTitle: true,
      backgroundColor: Colors.indigo[800],
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 50),
      ),
    );
  }
}
