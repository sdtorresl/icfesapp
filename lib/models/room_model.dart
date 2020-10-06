import 'dart:convert';

class RoomModel {
  RoomModel({
    this.id,
    this.title,
    this.description,
    this.picture,
    this.startDate,
    this.endDate,
    this.fieldIcon,
  });

  final int id;
  final String title;
  final String description;
  final String picture;
  final String startDate;
  final String endDate;
  final String fieldIcon;

  factory RoomModel.fromJson(String str) => RoomModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RoomModel.fromMap(Map<String, dynamic> json) => RoomModel(
        id: int.parse(json["id"]),
        title: json["title"],
        description: json["description"],
        picture: json["picture"],
        startDate: json["start-date"],
        endDate: json["end-date"],
        fieldIcon: json["field_icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "picture": picture,
        "start-date": startDate,
        "end-date": endDate,
        "field_icon": fieldIcon,
      };

  @override
  String toString() => this.toJson();
}
