import 'dart:convert';

class TaskDataList {
  TaskDataList({
    this.taskDate,
    this.taskTime,
    this.task,
    this.isDone,
  });

  String? taskDate;
  String? taskTime;
  String? task;
  bool? isDone;

  factory TaskDataList.fromJson(String str) =>
      TaskDataList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TaskDataList.fromMap(Map<String, dynamic> json) => TaskDataList(
        taskDate: json["taskDate"],
        taskTime: json["taskTime"],
        task: json["task"],
        isDone: json["isDone"],
      );

  Map<String, dynamic> toMap() => {
        "taskDate": taskDate,
        "taskTime": taskTime,
        "task": task,
        "isDone": isDone,
      };
}
