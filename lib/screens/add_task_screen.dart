import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({this.addTaskCallBack});
  late final Function? addTaskCallBack;
  // final _formKey = GlobalKey<FormState>();

  static String? newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.61,
        decoration: BoxDecoration(
          color: Color(0xFF757575),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.lightBlue,
                  ),
                ),
                SizedBox(height: 20),
                Consumer<TaskModel>(
                  builder: (context, dateProv, child) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(4.0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.red.shade100),
                          ),
                        ),
                      ),
                      onPressed: () {
                        dateProv.setDateOfTask(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.date_range,
                                        size: 18.0,
                                        color: Colors.teal,
                                      ),
                                      Text(
                                        ' ${dateProv.date}',
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "  Change",
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Consumer<TaskModel>(
                  builder: (context, timeProv, child) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(4.0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.red.shade100),
                          ),
                        ),
                      ),
                      onPressed: () {
                        timeProv.setTimeOfTask(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        size: 18.0,
                                        color: Colors.teal,
                                      ),
                                      Text(
                                        ' ${timeProv.time}',
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "  Change",
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Form(
                  // key: _formKey,
                  child: Consumer<TaskModel>(
                    builder: (context, oncProv, child) {
                      return Card(
                        elevation: 4.0,
                        child: Container(
                          height: 50,
                          child: TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Enter task title';
                            //   }
                            //   return null;
                            // },
                            onChanged: (value) {
                              oncProv.newTaskTitle = value;
                            },
                            autofocus: false,

                            // textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.abc,
                                  size: 30, color: Colors.black54),
                              hintText: 'Enter task title',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Consumer<TaskModel>(
                  builder: (context, addProv, child) {
                    return TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        backgroundColor: Color(0x824F77AA),
                        textStyle: const TextStyle(fontSize: 20),
                        // side: BorderSide(style: BorderStyle.solid),
                      ),
                      onPressed: () {
                        addProv.addTaskToList();
                        Navigator.pop(context);
                      },
                      child: const Text('Add'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
