import 'package:flutter/material.dart';
import 'package:studium_pi/utilities/constants.dart';

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
      backgroundColor: colorAppBar,
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorBackgroundApp,
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
