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
  });

  String title;
  String description;
  String picture;
  String startDate;
  String endDate;
  String icon;
  String room;

  factory ScheduleModel.fromJson(String str) =>
      ScheduleModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromMap(Map<String, dynamic> json) => ScheduleModel(
        title: json["title"],
        description: json["description"],
        picture: json["picture"],
        startDate: json["start-date"],
        endDate: json["end-date"],
        icon: json["icon"],
        room: json["room"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "picture": picture,
        "start-date": startDate,
        "end-date": endDate,
        "icon": icon,
        "room": room,
      };

  @override
  toString() => this.toJson();
}
