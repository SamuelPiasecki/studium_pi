import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Configurações'),
      centerTitle: true,
      backgroundColor: Colors.indigo[800],
    );
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey[800],
    );
  }
}
