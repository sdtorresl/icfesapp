import 'package:icfesapp/models/event_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class EventProvider {
  final String _url = "https://dev-eweb.us.seedcloud.co/json-evento-seedem";

  Future<EventModel> getEvent() async {
    try {
      var response = await http.get(_url);

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        EventModel event = EventModel.fromMap(jsonResponse[0]);

        return event;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {
      print(Exception);
    }

    return null;
  }
}
