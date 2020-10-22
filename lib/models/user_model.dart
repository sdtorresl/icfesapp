import 'dart:convert';

class UserModel {
  UserModel({
    this.name,
    this.lastName,
    this.token,
    this.mail,
    this.code,
  });

  String name;
  String lastName;
  String token;
  String mail;
  String code;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        lastName: json["last_name"],
        token: json["token"],
        mail: json["email"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "last_name": lastName,
        "token": token,
        "mail": mail,
        "code": code,
      };

  @override
  toString() => this.toJson();
}
