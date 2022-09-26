// ignore_for_file: public_member_api_docs, sort_constructors_first
class ToDoModel {
  bool isTaskCompleted;
  String title;
  ToDoModel({
    required this.title,
    this.isTaskCompleted = false,
  });

  static List<ToDoModel> todoList = [
    ToDoModel(title: 'Hello 1'),
    ToDoModel(title: 'Hello 2'),
    ToDoModel(title: 'Hello 3'),
    ToDoModel(title: 'Hello 4'),
  ];
}
