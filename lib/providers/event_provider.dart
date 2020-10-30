import 'package:global_configuration/global_configuration.dart';
import 'package:icfesapp/models/event_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class EventProvider {
  final String _url =
      GlobalConfiguration().getValue("api_url") + "/json-evento-seedem";

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
    } catch (Exception) {}

    return null;
  }
}
