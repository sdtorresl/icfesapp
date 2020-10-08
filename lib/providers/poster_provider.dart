import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:icfesapp/models/video_poster_model.dart';

class PosterProvider {
  final String _url = "https://dev-eweb.us.seedcloud.co/json-video-poster";

  Future<List<VideoPosterModel>> getPosters() async {
    try {
      var response = await http.get(_url);

      //print({responseCode: response.statusCode})

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<VideoPosterModel> posters = List();

        for (var item in jsonResponse) {
          VideoPosterModel poster = VideoPosterModel.fromJson(item);
          posters.add(poster);
          print(poster);
        }

        return posters;
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
