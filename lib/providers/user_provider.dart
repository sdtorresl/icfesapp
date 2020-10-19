import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as json;
import 'package:icfesapp/models/schedule_model.dart';
import 'package:icfesapp/models/user_model.dart';

class UserProvider {
  final String _url = "https://dev-eweb.us.seedcloud.co/login'";

  Future<List<UserModel>> login() async {
    try {
      var response = await http.get(_url);

      //print({responseCode: response.statusCode})

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<ScheduleModel> schedules = List();

        for (var item in jsonResponse) {
          print(item);
          ScheduleModel schedule = ScheduleModel.fromMap(item);
          schedules.add(schedule);
          print(schedule);
        }

        return schedules;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {}

    return [];
  }
}

main() async {
  String username = 'eweb';
  String password = 'E02i4BMX';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);

  Response r = await get(' https://dev-eweb.us.seedcloud.co/login',
      headers: <String, String>{'authorization': basicAuth});
  print(r.statusCode);
  print(r.body);

  var url = 'https://dev-eweb.us.seedcloud.co/login';
  http.post(url, body: json.encode({'email': 'code'})).then(
    (response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    },
  );
}
