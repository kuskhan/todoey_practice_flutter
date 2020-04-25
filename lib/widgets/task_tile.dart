import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final int taskIndex;

  TaskTile({this.isChecked, this.taskTitle, this.taskIndex});

  @override
  Widget build(BuildContext context) {
    TaskData taskData = Provider.of<TaskData>(context, listen: false);

    return ListTile(
      onLongPress: () {
        taskData.deleteTask(taskIndex);
      },
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) {
          taskData.toggleTask(taskIndex);
        },
      ),
    );
  }
}
