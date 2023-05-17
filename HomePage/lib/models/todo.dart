class Todo {
  int id;
  String title;
  bool isComplated;
  bool? isfavorite;

  Todo(
      {required this.id,
      required this.title,
      required this.isComplated,
      this.isfavorite = false
      });
}
