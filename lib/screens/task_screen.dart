import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task_model.dart';
import 'package:todo_flutter/widget/tasks_list.dart';
import 'package:provider/provider.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
              child: Consumer<TaskModel>(
                builder: (context, listProv, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.list,
                          size: 30,
                          color: Colors.lightBlueAccent,
                        ),
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Todoo',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        '${listProv.tasks.length} Tasks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
