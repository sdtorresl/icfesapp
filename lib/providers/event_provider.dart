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
        String dummyResponse =
            "[{\"title\":\"Seminario Internacional\",\"description\":\"charla crecimiento profesional\",\"picture\":\"/sites/default/files/2020-07/Group%20653.png\",\"start-date\":\"2020-10-30T16:34:52-0500\",\"end-date\":\"2020-10-01T16:34:58-0500\",\"sections\":[{\"title\":\"enlace a sesiones\",\"description\":\"charla crecimiento profesional\",\"picture\":\"/sites/default/files/2020-07/Group%20653.png\"},{\"title\":\"enlace a sesiones\",\"description\":\"charla crecimiento profesional\",\"picture\":\"/sites/default/files/2020-07/Group%20653.png\"},{\"title\":\"enlace a sesiones\",\"description\":\"charla crecimiento profesional\",\"picture\":\"/sites/default/files/2020-07/Group%20653.png\"}],\"documents\":[]}]";
        List<dynamic> jsonResponse = json.jsonDecode(dummyResponse);
        EventModel event = EventModel.fromMap(jsonResponse[0]);

        return event;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {}

    return null;
  }
}
