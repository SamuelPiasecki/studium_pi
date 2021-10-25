class Prof {
  String nome;
  String telefone;
  String email;
  String disciplina;
  String id;

  Prof({
    required this.nome,
    required this.id,
    this.email = '',
    this.telefone = '',
    this.disciplina = '',
  });
}
