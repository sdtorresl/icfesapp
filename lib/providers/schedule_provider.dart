import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import 'package:icfesapp/models/schedule_model.dart';

class ScheduleProvider {
  final String _url = "https://dev-eweb.us.seedcloud.co/json-sesiones";

  Future<List<ScheduleModel>> getSchedule() async {
    try {
      var response = await http.get(_url);

      //print({responseCode: response.statusCode})

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<ScheduleModel> schedules = List();

        for (var item in jsonResponse) {
          ScheduleModel schedule = ScheduleModel.fromMap(item);
          schedules.add(schedule);
        }

        return schedules;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {}

    return [];
  }
}
