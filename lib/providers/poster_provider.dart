import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import 'package:icfesapp/models/video_poster_model.dart';

class PosterProvider {
  final String _url = "https://dev-eweb.us.seedcloud.co/json-video-poster";

  Future<List<VideoPosterModel>> getPosters() async {
    try {
      var response = await http.get(_url);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.jsonDecode(response.body);

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
    try {
      var response = await http.get(_url);

      if (response.statusCode == 200) {
        // TODO: Implement method

        return true;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return false;
      }
    } catch (Exception) {
      print(Exception);
    }

    return false;
  }
}
