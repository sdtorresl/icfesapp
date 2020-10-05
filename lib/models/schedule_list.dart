import 'dart:convert';

List<ScheduleModel> scheduleModelFromJson(String str) =>
    List<ScheduleModel>.from(
        json.decode(str).map((x) => ScheduleModel.fromJson(x)));

String scheduleModelToJson(List<ScheduleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        title: json["title"],
        description: json["description"],
        picture: json["picture"],
        startDate: json["start-date"],
        endDate: json["end-date"],
        icon: json["icon"],
        room: json["room"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "picture": picture,
        "start-date": startDate,
        "end-date": endDate,
        "icon": icon,
        "room": room,
      };
}
