import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/pages/home/navdrawer.dart';
import 'package:table_calendar/table_calendar.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 // CalendarController _controller;

  @override

  void initState(){
    super.initState();
   // _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.indigo[800],
    );

    return Scaffold(
      drawer: NavDrawer(),
      appBar: appBar,
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 50),
      ),
    );
  }
}
