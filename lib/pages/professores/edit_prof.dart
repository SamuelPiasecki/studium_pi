import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/model/prof.dart';
import 'package:studium_pi/provider/prof_provider.dart';
import 'package:studium_pi/utilities/constants.dart';
import 'package:studium_pi/widget/prof_widget/prof_form_widget.dart';

class EditProfPage extends StatefulWidget {
  final Prof prof;
  const EditProfPage({Key? key, required this.prof}) : super(key: key);

  @override
  _EditProfPageState createState() => _EditProfPageState();
}

class _EditProfPageState extends State<EditProfPage> {
  final _formKey = GlobalKey<FormState>();
  late String nome;
  late String email;
  late String disciplina;
  late String telefone;

  @override
  void initState() {
    super.initState();

    nome = widget.prof.nome;
    email = widget.prof.email;
    disciplina = widget.prof.disciplina;
    telefone = widget.prof.telefone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Professor'),
        backgroundColor: colorAppBar,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final provider =
                  Provider.of<ProfProvider>(context, listen: false);
              provider.deleteProf(widget.prof);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ProfFormWidget(
            nome: nome,
            email: email,
            disciplina: disciplina,
            telefone: telefone,
            onChangedNome: (nome) => setState(() => this.nome = nome),
            onChangedEmail: (email) => setState(() => this.email = email),
            onChangedTelefone: (telefone) =>
                setState(() => this.telefone = telefone),
            onChangedDisciplina: (disciplina) =>
                setState(() => this.disciplina = disciplina),
            onSavedProf: saveProf,
          ),
        ),
      ),
    );
  }

  void saveProf() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<ProfProvider>(context, listen: false);

      provider.updateProf(widget.prof, nome, email, telefone, disciplina);

      Navigator.of(context).pop();
    }
  }
}
