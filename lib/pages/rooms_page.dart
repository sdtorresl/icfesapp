import 'package:flutter/material.dart';
import 'package:icfesapp/common/custom_webview.dart';
import 'package:icfesapp/common/room_list.dart';
import 'package:icfesapp/main.dart';
import 'package:icfesapp/models/room_model.dart';
import 'package:icfesapp/providers/rooms_provider.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({Key key}) : super(key: key);
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedTab = 0;
    List<Map<String, dynamic>> tabs = [
      {"title": 'Charlas en vivo', "widget": chat(context)},
      {"title": "Material pregrabado", "widget": poll(context)}
    ];

    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: tabs.map((tab) {
          int currentIndex = tabs.indexOf(tab);
          bool selected = currentIndex == _selectedTab;

          Function onTabFunction = () {
            setState(() {
              _selectedTab = currentIndex;
            });
          };

          return _tab(tab["title"], onTabFunction, selected);
        }).toList(),
      ),
    );
  }

  Widget _tab(String title, Function onTap, selected) {
    double borderRadius = 10;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? IcfesApp().primaryLight : IcfesApp().grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
        ),
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget chat(context) {
    return Text("holaaa");
  }

  Widget poll(context) {
    return Text("Hola");
  }
}

Widget roomList() {
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
