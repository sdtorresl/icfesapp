import 'package:icfesapp/models/prerecorded_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class PrerecordedProvider {
  final String _url =
      "https://seminariointernacional.icfes.gov.co/json-material-pregrabado";

  Future<List<PrerecordedModel>> getPrerecorded() async {
    try {
      var response = await http.get(_url);

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<PrerecordedModel> materials = List();

        for (var item in jsonResponse) {
          PrerecordedModel material = PrerecordedModel.fromMap(item);
          materials.add(material);
        }

        materials.sort((a, b) => a.order.compareTo(b.order));

        return materials;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {
      print(Exception);
    }

    return [];
  }
}
