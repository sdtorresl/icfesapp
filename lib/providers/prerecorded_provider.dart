import 'package:icfesapp/models/prerecorded_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class PrerecordedProvider {
  final String _url =
      "https://dev-eweb.us.seedcloud.co/json-material-pregrabado";

  Future<List<PrerecordedModel>> getPrerecorded() async {
    try {
      var response = await http.get(_url);

      //print({responseCode: response.statusCode})

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<PrerecordedModel> materials = List();

        for (var item in jsonResponse) {
          PrerecordedModel material = PrerecordedModel.fromMap(item);
          materials.add(material);
          print(material);
        }

        return materials;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {
      print("Aqui");
      print(Exception);
    }

    return [];
  }
}
