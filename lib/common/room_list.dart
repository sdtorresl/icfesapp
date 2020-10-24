import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/main.dart';

import 'package:icfesapp/models/room_model.dart';
import 'package:icfesapp/pages/transmission_page.dart';
import 'package:icfesapp/utils/alert_dialog.dart';
import 'package:icfesapp/utils/date_formatter.dart';

class RoomList extends StatelessWidget {
  final List<RoomModel> rooms;

  RoomList({@required this.rooms});
  @override
  Widget build(BuildContext context) {
    const String _baseUrl = "https://dev-eweb.us.seedcloud.co";

    List<Widget> roomList = List();

    for (var room in rooms) {
      String _pictureUrl = _baseUrl + room.picture;

      roomList.add(ExpansionCard(
        header: DateFormatter.dateTimeToString(room.startDate),
        title: room.title,
        subtitle: room.description,
        hidden: Column(
          children: [
            CachedNetworkImage(
              imageUrl: _pictureUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                child: Text(
                  "Ver transmisión en vivo",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white),
                ),
                onPressed: () => _openRoom(context, room),
                color: Icfesapp().accent,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ));
    }

    roomList.add(SizedBox(height: 35));
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: ListView(
        children: roomList,
      ),
    );
  }

  _openRoom(BuildContext context, RoomModel room) {
    DateTime now = DateTime.now();
    print(room);
    print(room.startDate.compareTo(now));
    if (room.startDate.compareTo(now) < 0) {
      if (room.endDate.compareTo(now) > 0 || true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransmissionPage(id: room.id),
          ),
        );
      } else {
        showMyDialog(
          context,
          "El evento ya ha finalizado",
          Text("Esta transmisión ya ha finalizado."),
        );
      }
    } else {
      showMyDialog(
        context,
        "El evento no ha empezado",
        Text("Este evento aun no ha comenzado, intenta de nuevo más tarde."),
      );
    }
  }
}
