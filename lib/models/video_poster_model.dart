import 'dart:convert';

class VideoPosterModel {
  VideoPosterModel({
    this.id,
    this.titulo,
    this.descripcion,
    this.videos,
    this.imagen,
    this.adjunto,
  });

  String id;
  String titulo;
  String descripcion;
  Videos videos;
  String imagen;
  String adjunto;

  factory VideoPosterModel.fromJson(String str) =>
      VideoPosterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoPosterModel.fromMap(Map<String, dynamic> json) =>
      VideoPosterModel(
        id: json["id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        videos: Videos.fromMap(json["videos"]),
        imagen: json["imagen"],
        adjunto: json["adjunto"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
        "videos": videos.toMap(),
        "imagen": imagen,
        "adjunto": adjunto,
      };
}

class Videos {
  Videos({
    this.url,
  });

  String url;

  factory Videos.fromJson(String str) => Videos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Videos.fromMap(Map<String, dynamic> json) => Videos(
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
      };
}
