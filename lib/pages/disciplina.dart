import 'package:flutter/material.dart';

class Disciplina extends StatefulWidget {
  @override
  _DisciplinaState createState() => _DisciplinaState();
}

class _DisciplinaState extends State<Disciplina> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Disciplinas'),
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
