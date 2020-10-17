import 'dart:convert';

class PrerecordedModel {
  PrerecordedModel({
    this.title,
    this.description,
    this.uploadDate,
    this.videoCode,
  });

  String title;
  String description;
  String uploadDate;
  String videoCode;

  factory PrerecordedModel.fromJson(String str) =>
      PrerecordedModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrerecordedModel.fromMap(Map<String, dynamic> json) =>
      PrerecordedModel(
        title: json["title"],
        description: json["description"],
        uploadDate: json["upload-date"],
        videoCode: json["video-code"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "upload-date": uploadDate,
        "video-code": videoCode,
      };
}
