import 'package:flutter/material.dart';
import 'package:studium_pi/utilities/constants.dart';

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
