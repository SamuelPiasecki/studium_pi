import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/model/event.dart';
import 'package:studium_pi/pages/eventos/evento_page.dart';
import 'package:studium_pi/provider/event_provider.dart';
import 'package:studium_pi/utilities/constants.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  const EventViewingPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: colorAppBar,
          leading: CloseButton(),
          actions: buildViewingActions(context, event),
        ),
        body: ListView(
          padding: EdgeInsets.all(32),
          children: [
            buildDateTime(event),
            SizedBox(height: 32),
            Text(
              event.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              event.description,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      );

  List<Widget> buildViewingActions(BuildContext context, Event event) => [
        IconButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => EventoPage(event: event),
            ),
          ),
          icon: Icon(Icons.edit),
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            final provider = Provider.of<EventProvider>(context, listen: false);
            provider.deleteEvent(event);
            Navigator.of(context).pop();
          },
        ),
      ];

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        //buildDate(event.isAllDay ? 'All-day' : 'Data Inicial', event.from
        //if (!event.isAllDay) buildDate('Data Final', event.to),
      ],
    );
  }
}
