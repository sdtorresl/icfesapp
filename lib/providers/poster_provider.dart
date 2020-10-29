import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:icfesapp/models/video_poster_model.dart';

class PosterProvider {
  Future<List<VideoPosterModel>> getPosters() async {
    final String _url =
        "https://seminariointernacional.icfes.gov.co/json-video-poster";

    try {
      var response = await http.get(_url);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);

        List<VideoPosterModel> posters = List();
        print(jsonResponse[0]["posters"]);

        for (var item in jsonResponse[0]["posters"]) {
          VideoPosterModel poster = VideoPosterModel.fromMap(item);
          posters.add(poster);
        }

        return posters;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {
      print(Exception);
    }

    return [];
  }

  Future<bool> votePoster(posterId) async {
    final String _url =
        "https://seminariointernacional.icfes.gov.co/webform_rest/submit";

    try {
      String username = 'eweb';
      String password = 'E02i4BMX';
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));

      String body = json.encode({
        'webform_id': "encuesta_video_app",
        '_cual_video_te_gusto_mas_': posterId.toString()
      });

      print(body);

      var response = await http.post(
        _url,
        body: body,
        headers: <String, String>{
          'authorization': basicAuth,
          'content-type': 'application/json'
        },
      );

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {
      print(Exception);
    }

    return false;
  }
}
