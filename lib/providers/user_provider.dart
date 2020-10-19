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

      var response = await http.post(
        _url,
        body: json.encode({'email': email, 'code': password}),
        headers: <String, String>{'authorization': basicAuth},
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return token(token);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {
      print(Exception);
    }

    return null;
  }

  Future<UserModel> token(String token) async {
    return null;
  }
}
