import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/provider/meta_provider.dart';
import 'package:studium_pi/utilities/constants.dart';
import 'package:studium_pi/widget/metas_widget/add_meta_dialog_widget.dart';
import 'package:studium_pi/widget/metas_widget/completed_list_widget.dart';
import 'package:studium_pi/widget/metas_widget/meta_list_widget.dart';

class MetaPage extends StatefulWidget {
  @override
  _MetaPageState createState() => _MetaPageState();
}

class _MetaPageState extends State<MetaPage> {
  int selectedIndex = 0;
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  @override
  Widget build(BuildContext context) {
    final tabs = [
      MetaListWidget(),
      CompletasWidget(),
    ];
    final appBar = AppBar(
      title: Text('Metas'),
      centerTitle: true,
      backgroundColor: colorAppBar,
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white.withOpacity(0.9),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(uid)
              .collection('Metas')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return buildText('${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final metas = snapshot.data;
            final provider = Provider.of<MetaProvider>(context);
            provider.readMetas(metas);
            return tabs[selectedIndex];
          }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'Metas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done, size: 28), label: 'Completas')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AddMetaDialogWidget(),
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
