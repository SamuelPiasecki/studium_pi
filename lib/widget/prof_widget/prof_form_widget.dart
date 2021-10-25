import 'package:flutter/material.dart';

class ProfFormWidget extends StatelessWidget {
  final String nome;
  final String email;
  final String telefone;
  final String disciplina;
  final ValueChanged<String> onChangedNome;
  final ValueChanged<String> onChangedEmail;
  final ValueChanged<String> onChangedTelefone;
  final ValueChanged<String> onChangedDisciplina;
  final VoidCallback onSavedProf;

  const ProfFormWidget({
    Key? key,
    this.nome = '',
    this.email = '',
    this.telefone = '',
    this.disciplina = '',
    required this.onChangedNome,
    required this.onChangedEmail,
    required this.onChangedTelefone,
    required this.onChangedDisciplina,
    required this.onSavedProf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildNome(),
            SizedBox(height: 8),
            buildEmail(),
            SizedBox(height: 8),
            buildTelefone(),
            SizedBox(height: 8),
            buildDisciplina(),
            SizedBox(height: 8),
            buildButton(),
          ],
        ),
      );

  Widget buildNome() => TextFormField(
        maxLines: 1,
        initialValue: nome,
        onChanged: onChangedNome,
        validator: (nome) {
          if (nome!.isEmpty) {
            return 'O nome não pode estar vazio';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Nome',
        ),
      );

  Widget buildEmail() => TextFormField(
        maxLines: 1,
        initialValue: email,
        onChanged: onChangedEmail,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Email',
        ),
      );

  Widget buildTelefone() => TextFormField(
        maxLines: 1,
        initialValue: telefone,
        onChanged: onChangedTelefone,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Telefone',
        ),
      );

  Widget buildDisciplina() => TextFormField(
        maxLines: 1,
        initialValue: disciplina,
        onChanged: onChangedDisciplina,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Disciplina',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onSavedProf,
          child: Text('Salvar'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
        ),
      );
}
