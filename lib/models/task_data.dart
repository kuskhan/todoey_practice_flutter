import 'package:flutter/foundation.dart';
import 'dart:collection';

class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});
}

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTask(index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }
}
