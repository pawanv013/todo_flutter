import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task_model.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    required this.isChacked,
    required this.taskTitle,
    required this.inx,
    required this.taskDate,
    required this.taskTime,
  });
  late final bool isChacked;
  late final String taskTitle;
  late final int inx;
  late final String taskDate;
  late final String taskTime;
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (context, iscProv, child) {
        return Card(
          color: Colors.grey.shade50,
          shadowColor: Colors.grey,
          elevation: 4.0,
          child: ListTile(
            isThreeLine: true,
            onLongPress: () {
              iscProv.deleteTask(inx);
            },
            title: Text(
              taskTitle,
              style: TextStyle(
                  decoration: isChacked ? TextDecoration.lineThrough : null),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(taskDate),
                Text(taskTime),
              ],
            ),
            trailing: Checkbox(
              activeColor: Colors.lightBlueAccent,
              value: isChacked, //iscProv.tasks[inx].isDone,
              onChanged: (val) {
                iscProv.toggleDone(val!, inx);
              }, //toggleCheckBoxState,
            ),
          ),
        );
      },
    );
  }
}
