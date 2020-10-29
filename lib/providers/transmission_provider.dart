import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:icfesapp/models/transmission_model.dart';

class TransmissionProvider {
  final String _url =
      "https://seminariointernacional.icfes.gov.co/json-transmision/1";

  Future<TransmissionModel> getTransmission(int id) async {
    String _endpoint = id == null ? _url + '/1' : _url + '/$id';

    try {
      var response = await http.get(_endpoint);

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        TransmissionModel transmission =
            TransmissionModel.fromMap(jsonResponse[0]);

        return transmission;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {
      print(Exception);
    }

    return null;
  }
}
