import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/main.dart';

import 'package:icfesapp/models/room_model.dart';
import 'package:icfesapp/pages/meetings_page.dart';
import 'package:icfesapp/pages/transmission_page.dart';
import 'package:icfesapp/preferences/user_preferences.dart';
import 'package:icfesapp/utils/alert_dialog.dart';
import 'package:icfesapp/utils/date_formatter.dart';

class RoomList extends StatelessWidget {
  final List<RoomModel> rooms;

  RoomList({@required this.rooms});

  @override
  Widget build(BuildContext context) {
    final String _baseUrl = GlobalConfiguration().getValue("api_url");
    final _prefs = UserPreferences();
    final bool _isPremiumUser = _prefs.isPremium;

    List<Widget> roomList = [];

    for (var room in rooms) {
      String _pictureUrl = _baseUrl + room.picture;
      Widget roomAction;

      if (room.isMeeting) {
        roomAction = RaisedButton(
          child: Text(
            "Unirse a la reunión",
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white),
          ),
          onPressed: () => _openMeeting(context, room),
          color: IcfesApp().accent,
        );
      } else {
        roomAction = RaisedButton(
          child: Text(
            "En vivo",
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white),
          ),
          onPressed: () => _openRoom(context, room),
          color: IcfesApp().accent,
        );
      }

      Widget roomWidget = ExpansionCard(
        header: DateFormatter.dateTimeToString(room.startDate),
        title: room.title,
        subtitle: room.description,
        highlight: room.isPrivate,
        hidden: Column(
          children: [
            CachedNetworkImage(
              imageUrl: _pictureUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 15),
            SizedBox(
                width: MediaQuery.of(context).size.width, child: roomAction),
            SizedBox(height: 10),
          ],
        ),
      );

      // Only add to list if it's premium user
      if (room.isPrivate && _isPremiumUser) {
        roomList.add(roomWidget);
      } else {
        if (!room.isPrivate) {
          roomList.add(roomWidget);
        }
      }
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

    if (room.startDate.compareTo(now) < 0) {
      if (room.endDate.compareTo(now) > 0) {
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
          Text("Este evento ya ha finalizado."),
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

  _openMeeting(BuildContext context, RoomModel room) {
    DateTime now = DateTime.now();

    if (room.startDate.compareTo(now) < 0) {
      if (room.endDate.compareTo(now) > 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MeetingsPage(
              host: room.meetingHost,
              room: room.meetingRoom,
              subject: room.title,
              description: room.description,
            ),
          ),
        );
      } else {
        showMyDialog(
          context,
          "El evento ya ha finalizado",
          Text("Este evento ya ha finalizado."),
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
