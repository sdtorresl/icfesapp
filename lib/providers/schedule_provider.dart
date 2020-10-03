import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import 'package:icfesapp/models/room_model.dart';

class ScheduleProvider {
  final String _url = "https://dev-eweb.us.seedcloud.co/json-salas";

  Future<List<RoomModel>> getSchedule() async {
    try {
      var response = await http.get(_url);

      //print({responseCode: response.statusCode})

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<RoomModel> schedules = List();

        for (var item in jsonResponse) {
          RoomModel schedule = RoomModel.fromMap(item);
          schedules.add(schedule);
          print(schedule);
        }

        return schedules;
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
