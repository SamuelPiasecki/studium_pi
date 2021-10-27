import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/model/disciplina.dart';
import 'package:studium_pi/pages/disciplina/view_disciplina.dart';
import 'package:studium_pi/provider/disc_provider.dart';
import 'package:studium_pi/utilities/constants.dart';
import 'package:studium_pi/utilities/utils.dart';
import 'package:weekday_selector/weekday_selector.dart';

class DisciplinaPage extends StatefulWidget {
  final Disciplina? disc;

  const DisciplinaPage({Key? key, this.disc}) : super(key: key);

  @override
  _DisciplinaPageState createState() => _DisciplinaPageState();
}

class _DisciplinaPageState extends State<DisciplinaPage> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  late DateTime startTime;
  late DateTime endTime;
  List<bool> values = List.filled(7, false);

  @override
  void initState() {
    super.initState();

    if (widget.disc == null) {
      startTime = DateTime.now();
      endTime = DateTime.now().add(Duration(hours: 2));
    } else {
      final disc = widget.disc!;

      nomeController.text = disc.nome;
      startTime = disc.startTime;
      endTime = disc.endTime;
      values = List.from(disc.weekDays);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: CloseButton(),
      title: Text('Disciplina'),
      actions: buildEditingActions(),
      centerTitle: true,
      backgroundColor: colorAppBar,
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorBackgroundApp,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildNome(),
              SizedBox(height: 20),
              WeekdaySelector(
                  onChanged: (int day) {
                    setState(() {
                      final index = day % 7;
                      values[index] = !values[index];
                    });
                  },
                  values: values),
              SizedBox(height: 20),
              buildDatetimePickers(),
            ],
          ),
        ),
      ),
    );
  }

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

  Widget buildNome() => TextFormField(
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            border: UnderlineInputBorder(), hintText: 'Nome da Disciplina'),
        onFieldSubmitted: (_) => saveForm(),
        validator: (title) => title != null && title.isEmpty
            ? 'O Nome não pode estar vazio'
            : null,
        controller: nomeController,
      );

  Widget buildDatetimePickers() => Column(
        children: [
          buildStart(),
          buildEnd(),
        ],
      );

  Widget buildStart() => buildHeader(
        header: 'Horário Inicial',
        child: Row(
          children: [
            Expanded(
              child: buildDropdownField(
                text: Utils.toTime(startTime),
                onClicked: () => pickFromDateTime(),
              ),
            ),
          ],
        ),
      );

  Widget buildEnd() => buildHeader(
        header: 'Horário Final',
        child: Row(
          children: [
            Expanded(
              child: buildDropdownField(
                text: Utils.toTime(endTime),
                onClicked: () => pickToDateTime(),
              ),
            ),
          ],
        ),
      );

  Future pickFromDateTime() async {
    final date = await pickDateTime(startTime);
    if (date == null) return;

    if (date.isAfter(endTime)) {
      endTime = DateTime(
          date.year, date.month, date.day, startTime.hour, startTime.minute);
    }

    setState(() => startTime = date);
  }

  Future pickToDateTime() async {
    final date = await pickDateTime(
      endTime,
    );
    if (date == null) return;

    setState(() => endTime = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    DateTime? firstDate,
  }) async {
    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate),
    );

    if (timeOfDay == null) return null;

    final date = DateTime(initialDate.year, initialDate.month, initialDate.day);
    final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

    return date.add(time);
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
      final disc = Disciplina(
          nome: nomeController.text,
          startTime: startTime,
          endTime: endTime,
          id: '',
          weekDays: List.from(values));

      final isEditing = widget.disc != null;
      final provider = Provider.of<DiscProvider>(context, listen: false);
      if (isEditing) {
        provider.updateDisc(disc, widget.disc!);
      } else {
        provider.addDisc(disc);
      }

      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ViewDisciplina()));
    }
  }
}
