import 'package:flutter/material.dart';

class Nota extends StatefulWidget {
  @override
  _NotaState createState() => _NotaState();
}

class _NotaState extends State<Nota> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Notas'),
      centerTitle: true,
      backgroundColor: Colors.indigo[800],
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey[800],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 50),
      ),
    );
  }
}
