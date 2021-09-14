import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/pages/eventos/evento_page.dart';
import 'package:studium_pi/pages/home/navdrawer.dart';
import 'package:studium_pi/utilities/constants.dart';
import 'package:studium_pi/widget/calendarwidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: colorAppBar,
    );

    return Scaffold(
      drawer: NavDrawer(),
      appBar: appBar,
      backgroundColor: colorBackgroundApp,
      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EventoPage()),
        ),
        child: Icon(Icons.add, size: 50),
      ),
    );
  }
}
