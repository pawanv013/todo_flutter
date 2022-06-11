import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_model.dart';
import 'task_tile.dart';

class TasksList extends StatefulWidget {
  // TasksList({required this.tasks});
  // late final List<Task> tasks;
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (context, tasProv, child) {
        return ListView.builder(
          itemCount: tasProv.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              isChacked: tasProv.tasks[index].isDone!,
              taskTitle: tasProv.tasks[index].task!.toUpperCase(),
              inx: index,
              taskDate: tasProv.tasks[index].taskDate!,
              taskTime: tasProv.tasks[index].taskTime!,
              // checkBoxCallBack: (bool? checkboxState) {
              //   tasProv.toggleDone(checkboxState!, index);
              // },
            );
          },
        );
      },
    );
  }
}
