import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/model/event.dart';
import 'package:studium_pi/provider/event_provider.dart';
import 'package:studium_pi/utilities/constants.dart';
import 'package:studium_pi/utilities/utils.dart';

class EventoPage extends StatefulWidget {
  final Event? event;

  const EventoPage({Key? key, this.event}) : super(key: key);

  @override
  _EventoPageState createState() => _EventoPageState();
}

class _EventoPageState extends State<EventoPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    } else {
      final event = widget.event!;

      titleController.text = event.title;
      descController.text = event.description;
      fromDate = event.from;
      toDate = event.to;
    }
  }

  @override
  void dispose() {
    titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          actions: buildEditingActions(),
          title: Text('Eventos'),
          centerTitle: true,
          backgroundColor: colorAppBar,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTitle(),
                SizedBox(height: 12),
                buildDesc(),
                SizedBox(height: 12),
                buildDatetimePickers(),
              ],
            ),
          ),
        ),
      );

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          icon: Icon(Icons.done),
          label: Text('SALVAR'),
          onPressed: saveForm,
        ),
      ];

  Widget buildTitle() => TextFormField(
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            border: UnderlineInputBorder(), hintText: 'Adicione Título'),
        onFieldSubmitted: (_) => saveForm(),
        validator: (title) => title != null && title.isEmpty
            ? 'O Título não pode estar vazio'
            : null,
        controller: titleController,
      );

  Widget buildDesc() => TextFormField(
        maxLines: 3,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Adicione Descrição'),
        onFieldSubmitted: (_) => saveForm(),
        controller: descController,
      );

  Widget buildDatetimePickers() => Column(
        children: [
          buildFrom(),
          buildTo(),
        ],
      );

  Widget buildFrom() => buildHeader(
        header: 'Data Inicial',
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: Utils.toDate(fromDate),
                onClicked: () => pickFromDateTime(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropdownField(
                text: Utils.toTime(fromDate),
                onClicked: () => pickFromDateTime(pickDate: false),
              ),
            ),
          ],
        ),
      );

  Widget buildTo() => buildHeader(
        header: 'Data Final',
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: Utils.toDate(toDate),
                onClicked: () => pickToDateTime(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropdownField(
                text: Utils.toTime(toDate),
                onClicked: () => pickToDateTime(pickDate: false),
              ),
            ),
          ],
        ),
      );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate: pickDate,
      firstDate: pickDate ? fromDate : null,
    );
    if (date == null) return;

    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2015, 8),
        lastDate: DateTime(2101),
      );

      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeOfDay == null) return null;

      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

      return date.add(time);
    }
  }

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          child,
        ],
      );

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final event = Event(
        title: titleController.text,
        description: descController.text,
        from: fromDate,
        to: toDate,
        id: '',
      );

      final isEditing = widget.event != null;
      final provider = Provider.of<EventProvider>(context, listen: false);

      if (isEditing) {
        provider.editEvent(event, widget.event!);
        Navigator.of(context).pop();
      } else {
        provider.addEvento(event);
      }

      Navigator.of(context).pop();
    }
  }
}
