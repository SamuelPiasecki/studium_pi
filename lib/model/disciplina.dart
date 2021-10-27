class Disciplina {
  String nome;
  DateTime startTime;
  DateTime endTime;
  String id;
  List<bool> weekDays;

  Disciplina(
      {required this.nome,
      required this.startTime,
      required this.endTime,
      required this.id,
      required this.weekDays});
}
