import 'package:flutter/material.dart';
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
      body: tabs[selectedIndex],
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
        child: Icon(Icons.add, size: 50),
      ),
    );
  }
}
