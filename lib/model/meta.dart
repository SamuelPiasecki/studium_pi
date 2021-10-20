class Meta {
  String title;
  String description;
  bool isDone;
  String id;

  Meta({
    required this.title,
    required this.id,
    this.description = '',
    this.isDone = false,
  });
}
