import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task_model.dart';
import 'package:todo_flutter/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var taskMdl = TaskModel();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: taskMdl),
        // StreamProvider<void>.value(
        //   value: taskMdl.instantNofitication(),
        //   initialData: [],
        // ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    );
  }
}
