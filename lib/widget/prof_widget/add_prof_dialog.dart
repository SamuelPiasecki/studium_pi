import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/model/prof.dart';
import 'package:studium_pi/provider/prof_provider.dart';
import 'package:studium_pi/widget/prof_widget/prof_form_widget.dart';

class AddProfDialogWidget extends StatefulWidget {
  @override
  _AddProfDialogWidgetState createState() => _AddProfDialogWidgetState();
}

class _AddProfDialogWidgetState extends State<AddProfDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String nome = '';
  String email = '';
  String telefone = '';
  String disciplina = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adicionar Professor',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 8),
            ProfFormWidget(
              onChangedNome: (nome) => setState(() => this.nome = nome),
              onChangedEmail: (email) => setState(() => this.email = email),
              onChangedTelefone: (telefone) =>
                  setState(() => this.telefone = telefone),
              onChangedDisciplina: (disciplina) =>
                  setState(() => this.disciplina = disciplina),
              onSavedProf: addProf,
            ),
          ],
        ),
      ),
    );
  }

  void addProf() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final prof = Prof(
        id: '',
        nome: nome,
        email: email,
        telefone: telefone,
        disciplina: disciplina,
      );

      final provider = Provider.of<ProfProvider>(context, listen: false);
      provider.addProf(prof);

      Navigator.of(context).pop();
    }
  }
}
