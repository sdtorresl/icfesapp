import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/models/room_model.dart';
import 'package:icfesapp/utils/date_formatter.dart';

class RoomList extends StatelessWidget {
  final List<RoomModel> rooms;

  RoomList({@required this.rooms});
  @override
  Widget build(BuildContext context) {
    const String _baseUrl = "https://dev-eweb.us.seedcloud.co";
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          String _pictureUrl = _baseUrl + rooms[index].picture;
          return ExpansionCard(
            starDate: DateFormatter.dateTimeToString(rooms[index].startDate),
            title: rooms[index].title,
            subtitle: rooms[index].description,
            picture: CachedNetworkImage(
              imageUrl: _pictureUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }
}
