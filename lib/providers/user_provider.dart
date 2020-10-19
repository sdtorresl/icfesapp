import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:icfesapp/models/user_model.dart';

class UserProvider {
  Future<UserModel> login(String email, String code) async {
    final String _url = "https://dev-eweb.us.seedcloud.co/login'";
    try {
      String username = 'eweb';
      String password = 'E02i4BMX';
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      print(basicAuth);

      print(_url);
      String body = json.encode({'email': email, 'code': code});
      var response = await http.post(
        _url,
        body: body,
        headers: <String, String>{'authorization': basicAuth},
      );
      print(body);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return token(username);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {
      print('aqui');
      print(Exception);
    }
    return null;
  }

  final String _url = "https://dev-eweb.us.seedcloud.co/usuarios/{token}";
  Future<UserModel> token(String token) async {
    /* try {
    var response = await http.get(_url);
      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<UserModel> users;

        for (var item in jsonResponse) {
          print(item);
          UserModel user = UserModel.fromMap(item);
          users.add(user);
          print(user);
        }

        return users;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {}*/

    return null;
  }
}
