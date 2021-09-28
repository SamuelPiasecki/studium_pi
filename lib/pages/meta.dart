import 'package:flutter/material.dart';
import 'package:studium_pi/utilities/constants.dart';

class Meta extends StatefulWidget {
  @override
  _MetaState createState() => _MetaState();
}

class _MetaState extends State<Meta> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Metas'),
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
