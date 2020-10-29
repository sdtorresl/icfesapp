import 'package:icfesapp/models/room_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class RoomsProvider {
  final String _url = "https://seminariointernacional.icfes.gov.co/json-salas";

  Future<List<RoomModel>> getRooms() async {
    try {
      var response = await http.get(_url);

      //print({responseCode: response.statusCode})

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<RoomModel> rooms = List();

        for (var item in jsonResponse) {
          RoomModel room = RoomModel.fromMap(item);
          rooms.add(room);
        }

        return rooms;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {}

    return [];
  }
}
