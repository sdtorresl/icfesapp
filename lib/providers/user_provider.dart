import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:icfesapp/models/user_model.dart';

class UserProvider {
  Future<UserModel> login(String email, String code) async {
    final String _url = "https://dev-eweb.us.seedcloud.co/login";

    try {
      String username = 'eweb';
      String password = 'E02i4BMX';
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      String body = json.encode({'email': email, 'code': code});

      var response = await http.post(
        _url,
        body: body,
        headers: <String, String>{
          'authorization': basicAuth,
          'content-type': 'application/json'
        },
      );

      switch (response.statusCode) {
        case 200:
          String token = json.decode(response.body)["token"];
          UserModel user = await getUser(token);
          return user;
          break;
        default:
      }
    } catch (Exception) {
      print(Exception);
    }
    return null;
  }

  Future<UserModel> getUser(String token) async {
    final String _url = "https://dev-eweb.us.seedcloud.co/usuarios/" + token;

    try {
      String username = 'eweb';
      String password = 'E02i4BMX';
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));

      var response = await http.get(
        _url,
        headers: <String, String>{
          'authorization': basicAuth,
          'content-type': 'application/json'
        },
      );

      print(response.body);
      return UserModel.fromJson(response.body);
    } catch (Exception) {
      print(Exception);
      return null;
    }
  }
}
