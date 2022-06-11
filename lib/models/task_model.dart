import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_flutter/data/task_data_list.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TaskModel extends ChangeNotifier {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late List<TaskDataList> _tasks = [];
  List<TaskDataList> get tasks => _tasks;

  String newTaskTitle = '';
  String _date = "Set task date";
  String get date => _date;
  String _time = DateFormat('hh:mm a')
      .format(DateTime.now().add(Duration(minutes: 15)))
      .toString(); //"Set task time";
  String get time => _time;

  addTaskToList() {
    _tasks.add(TaskDataList(
        isDone: false, task: newTaskTitle, taskDate: _date, taskTime: _time));
    notifyListeners();
  }

  void toggleDone(bool checkboxState, int indx) {
    _tasks[indx].isDone = checkboxState;
    notifyListeners();
  }

  void deleteTask(int indx) {
    _tasks.remove(_tasks[indx]);
    notifyListeners();
  }

  setDateOfTask(context) {
    DatePicker.showDatePicker(
      context,
      theme: DatePickerTheme(containerHeight: 210.0),
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime.now().add(Duration(days: 366)),
      onConfirm: (date) {
        _date = DateFormat('dd/MM/yyyy').format(date).toString();
        notifyListeners();
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  setTimeOfTask(BuildContext context) {
    DatePicker.showTimePicker(context,
        theme: DatePickerTheme(
          containerHeight: 210.0,
        ),
        showTitleActions: true, onConfirm: (time) {
      _time = DateFormat('hh:mm a').format(time).toString();
      notifyListeners();
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  // notification Initializetion

  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('ic_launcher.png');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
    });
  }

  //Instant Notifications
  instantNofitication() async {
    try {
      var android = AndroidNotificationDetails("id", "channel",
          channelDescription: 'monthly notificationdescription');

      var platform = new NotificationDetails(android: android);

      await _flutterLocalNotificationsPlugin.show(
          0, "Demo instant notification", "Tap to do something", platform,
          payload: "Welcome to demo app");
    } catch (e) {
      print(e.toString());
    }
  }
}
