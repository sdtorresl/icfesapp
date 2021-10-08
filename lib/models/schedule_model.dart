// To parse this JSON data, do
//
//     final scheduleModel = scheduleModelFromMap(jsonString);

import 'dart:convert';

class ScheduleModel {
  ScheduleModel({
    this.title,
    this.description,
    this.picture,
    this.startDate,
    this.endDate,
    this.icon,
    this.room,
    this.categoria,
  });

  String title;
  String description;
  String picture;
  DateTime startDate;
  DateTime endDate;
  String icon;
  String room;
  String categoria;

  factory ScheduleModel.fromJson(String str) =>
      ScheduleModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromMap(Map<String, dynamic> json) => ScheduleModel(
      title: json["title"],
      description: json["description"],
      picture: json["picture"],
      startDate: DateTime.parse(json["start-date"]).toLocal(),
      endDate: DateTime.parse(json["end-date"]).toLocal(),
      icon: json["icon"],
      room: json["room"],
      categoria: json["categoria"]);

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "picture": picture,
        "start-date": startDate.toIso8601String(),
        "end-date": endDate.toIso8601String(),
        "icon": icon,
        "room": room,
        "categoria": categoria,
      };

  @override
  toString() => this.toJson();
}
