import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/models/room_model.dart';

class RoomList extends StatelessWidget {
  final List<RoomModel> rooms;

  RoomList({@required this.rooms});
  @override
  Widget build(BuildContext context) {
    const String _baseUrl = "https://dev-eweb.us.seedcloud.co";
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            String _pictureUrl = _baseUrl + rooms[index].picture;
            return ExpansionCard(
              starDate: rooms[index].startDate,
              title: rooms[index].title,
              subtitle: rooms[index].description,
              picture: CachedNetworkImage(
                imageUrl: _pictureUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );

            /* return Container(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 1,
                        height: 50,
                        color: Colors.black,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 6.0, color: Colors.blue[50]),
                          color: Colors.teal[50],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.circle,
                          color: Colors.blue,
                        ),
                      ),
                      Container(width: 3, height: 30, color: Colors.black),
                    ],
                  ),
                  ExpansionCard(
                    title: "Sala 1",
                    subtitle: "por:",
                    picture: Image.asset('assets/img/sem2020.png'),
                  ),
                ],
              ),
            ); */
          }),
    );
  }
}
