import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:icfesapp/models/social_network_model.dart';

class SocialNetworkProvider {
  final String _url = "https://dev-eweb.us.seedcloud.co/json-redes-sociales";

  Future<SocialNetworkModel> getSocialNetworks() async {
    try {
      var response = await http.get(_url);

      print(response.body);

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);

        SocialNetworkModel socialNetwork =
            SocialNetworkModel.fromMap(jsonResponse[0]['social-networks']);

        return socialNetwork;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {
      print(Exception);
    }

    return null;
  }
}
