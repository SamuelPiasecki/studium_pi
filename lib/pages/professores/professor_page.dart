import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/provider/prof_provider.dart';
import 'package:studium_pi/utilities/constants.dart';
import 'package:studium_pi/widget/prof_widget/add_prof_dialog.dart';
import 'package:studium_pi/widget/prof_widget/prof_list_widget.dart';

class ProfessorPage extends StatefulWidget {
  @override
  _ProfessorPageState createState() => _ProfessorPageState();
}

class _ProfessorPageState extends State<ProfessorPage> {
  final Stream<QuerySnapshot> snapshots =
      FirebaseFirestore.instance.collection('Professores').snapshots();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Professores'),
      centerTitle: true,
      backgroundColor: colorAppBar,
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white.withOpacity(0.9),
      body: StreamBuilder(
        stream: snapshots,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return buildText('${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final profs = snapshot.data;
          final provider = Provider.of<ProfProvider>(context);
          provider.readProf(profs);
          return ProfListWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AddProfDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
