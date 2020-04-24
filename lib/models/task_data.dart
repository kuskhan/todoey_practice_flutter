import 'package:flutter/foundation.dart';

class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});
}

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  int get taskCount {
    return tasks.length;
  }

  void addTask(task) {
    tasks.add(task);
    notifyListeners();
  }

  void toggleTask(index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }
}
