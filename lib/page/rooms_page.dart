import 'package:flutter/material.dart';
import 'package:icfesapp/common/room_list.dart';
import 'package:icfesapp/providers/rooms_provider.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomsProvider = RoomsProvider();
    return FutureBuilder(
      future: roomsProvider.getRooms(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return RoomList(rooms: snapshot.data);
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
