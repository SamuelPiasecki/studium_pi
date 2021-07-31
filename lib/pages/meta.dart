import 'package:flutter/material.dart';

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
