import 'dart:convert';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:icfesapp/models/user_model.dart';
import 'package:icfesapp/preferences/user_preferences.dart';

class UserProvider {
  final _prefs = UserPreferences();

  Future<UserModel> login(String email, String code) async {
    final String _url = GlobalConfiguration().getValue("api_url") + "/login";

    try {
      String encryptedCode = base64Encode(
        utf8.encode(code),
      );
      String username = 'eweb';
      String password = 'E02i4BMX';
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      String body =
          json.encode({'email': email, 'code': encryptedCode, 'premium': "1"});

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
          bool isPremium = json.decode(response.body)["flag"] == 1;
          _prefs.isPremium = isPremium;

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
    final String _url =
        GlobalConfiguration().getValue("api_url") + "/usuarios/" + token;

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

      UserModel user = UserModel.fromJson(response.body);

      if (user.mail != null) {
        print("Token saved");
        _prefs.token = token;
      }

      return user;
    } catch (Exception) {
      print(Exception);
      return null;
    }
  }
}
