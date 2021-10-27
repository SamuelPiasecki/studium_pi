import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/pages/disciplina/disciplina_page.dart';
import 'package:studium_pi/provider/disc_provider.dart';
import 'package:studium_pi/utilities/constants.dart';
import 'package:studium_pi/widget/disc_widget/list_disc_widget.dart';

class ViewDisciplina extends StatefulWidget {
  const ViewDisciplina({Key? key}) : super(key: key);

  @override
  _ViewDisciplinaState createState() => _ViewDisciplinaState();
}

class _ViewDisciplinaState extends State<ViewDisciplina> {
  final appBar = AppBar(
    title: Text('Disciplinas'),
    centerTitle: true,
    backgroundColor: colorAppBar,
  );
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white.withOpacity(0.9),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .collection('Disciplinas')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final discs = snapshot.data;
          final provider = Provider.of<DiscProvider>(context);
          provider.readDisc(discs);
          return DiscListWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => DisciplinaPage(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
