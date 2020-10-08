import 'dart:convert';

List<VideoPosterModel> videoPosterModelFromJson(String str) =>
    List<VideoPosterModel>.from(
        json.decode(str).map((x) => VideoPosterModel.fromJson(x)));

String videoPosterModelToJson(List<VideoPosterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoPosterModel {
  VideoPosterModel({
    this.posters,
  });

  List<Poster> posters;

  factory VideoPosterModel.fromJson(Map<String, dynamic> json) =>
      VideoPosterModel(
        posters:
            List<Poster>.from(json["posters"].map((x) => Poster.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "posters": List<dynamic>.from(posters.map((x) => x.toJson())),
      };
}

class Poster {
  Poster({
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

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
        id: json["id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        videos: Videos.fromJson(json["videos"]),
        imagen: json["imagen"],
        adjunto: json["adjunto"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
        "videos": videos.toJson(),
        "imagen": imagen,
        "adjunto": adjunto,
      };
}

class Videos {
  Videos({
    this.url,
  });

  String url;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
