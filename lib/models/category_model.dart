import 'dart:convert';

class CategoryModel {
  CategoryModel({
    this.id,
    this.nombre,
  });

  int id;
  String nombre;

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: int.parse(json["id"]),
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {"id": id};

  @override
  toString() => this.toJson();
}
