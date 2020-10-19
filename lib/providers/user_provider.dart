import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:icfesapp/models/user_model.dart';

class RoomsProvider {
  final String _url = " https://dev-eweb.us.seedcloud.co/login";

  Future<List<UserModel>> post() async {
    try {
      var response = await http.get(_url);

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<UserModel> token = List();

        for (var item in jsonResponse) {
          UserModel login = UserModel.fromMap(item);
          token.add(login);
          print(login);
        }

        return token;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {}

    return [];
  }
}
