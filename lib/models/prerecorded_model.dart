import 'dart:convert';

class PrerecordedModel {
  PrerecordedModel({
    this.title,
    this.description,
    this.uploadDate,
    this.videoCode,
    this.highlighted,
    this.order,
    this.category,
  });

  String title;
  String description;
  DateTime uploadDate;
  String videoCode;
  String category;
  bool highlighted;
  int order;

  factory PrerecordedModel.fromJson(String str) =>
      PrerecordedModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrerecordedModel.fromMap(Map<String, dynamic> json) =>
      PrerecordedModel(
        title: json["title"],
        description: json["description"],
        uploadDate: DateTime.tryParse(json["upload-date"]).subtract(
          Duration(hours: 5),
        ),
        videoCode: json["video-code"],
        order: int.tryParse(json["order"]),
        highlighted: json["flag"] == "1",
        category: json["categoria"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "upload-date": uploadDate.toIso8601String(),
        "video-code": videoCode,
        "highlighted": highlighted,
        "order": order,
        "category": category,
      };

  @override
  String toString() => this.toJson();
}
