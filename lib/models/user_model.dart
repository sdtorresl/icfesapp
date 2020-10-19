import 'dart:convert';

class UserModel {
  UserModel({
    this.name,
    this.token,
    this.mail,
    this.code,
  });

  String name;
  String token;
  String mail;
  String code;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        token: json["token"],
        mail: json["mail"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "token": token,
        "mail": mail,
        "code": code,
      };
}
