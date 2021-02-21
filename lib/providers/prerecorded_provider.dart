import 'package:global_configuration/global_configuration.dart';
import 'package:icfesapp/models/prerecorded_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class PrerecordedProvider {
  final String _baseUrl = GlobalConfiguration().getValue("api_url");

  Future<List<PrerecordedModel>> getPrerecorded() async {
    final String _url = _baseUrl + "/json-material-pregrabado";

    try {
      var response = await http.get(_url);

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<PrerecordedModel> materials = [];

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

  Future<List<PrerecordedModel>> getHistoric() async {
    final String _url = _baseUrl + "/json-retransmision";

    try {
      var response = await http.get(_url);

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<PrerecordedModel> materials = [];

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
