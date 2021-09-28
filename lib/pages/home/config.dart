import 'package:flutter/material.dart';
import 'package:studium_pi/utilities/constants.dart';

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
      backgroundColor: colorAppBar,
    );
    return Scaffold(
      appBar: appBar,
      backgroundColor: colorBackgroundApp,
    );
  }
}
