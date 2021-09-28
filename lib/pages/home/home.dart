import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:studium_pi/pages/disciplina.dart';
import 'package:studium_pi/pages/eventos/evento_page.dart';
import 'package:studium_pi/pages/home/navdrawer.dart';
import 'package:studium_pi/utilities/constants.dart';
import 'package:studium_pi/widget/calendarwidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final isDialOpen = ValueNotifier(false);


  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: colorAppBar,
    );

    return WillPopScope(
      onWillPop: () async {
        if(isDialOpen.value){
          //close speed dial
          isDialOpen.value = false;

          return false;
        } else{
          return true;
        }
      },
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: appBar,
        backgroundColor: colorBackgroundApp,
        body: CalendarWidget(),
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          openCloseDial: isDialOpen,
          children: [
            SpeedDialChild(
              child: Icon(Icons.event),
              label: 'Eventos',
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EventoPage()))
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.calendar_today),
              label: 'Disciplinas',
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Disciplina()))
              },
            ),
          ],
        ),
      ),
    );
  }
}
