import 'package:flutter/material.dart';
import 'package:studium_pi/utilities/constants.dart';

class Professor extends StatefulWidget {
  @override
  _ProfessorState createState() => _ProfessorState();
}

class _ProfessorState extends State<Professor> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Professores'),
      centerTitle: true,
      backgroundColor: colorAppBar,
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorBackgroundApp,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 50),
      ),
    );
  }
}
