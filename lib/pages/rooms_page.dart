import 'package:flutter/material.dart';
import 'package:icfesapp/common/recorded_list.dart';
import 'package:icfesapp/common/room_list.dart';
import 'package:icfesapp/main.dart';
import 'package:icfesapp/providers/prerecorded_provider.dart';
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

  int _selectedTab = 0;
  Widget _currentWidget;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {"title": 'En vivo', "widget": roomList(context)},
      {"title": "Sala Colombia e Historico", "widget": recordedList(context)}
    ];
    if (_currentWidget == null) {
      _currentWidget = roomList(context);
    }

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: tabs.map((tab) {
              int currentIndex = tabs.indexOf(tab);
              bool selected = currentIndex == _selectedTab;

              Function onTabFunction = () {
                setState(() {
                  _selectedTab = currentIndex;
                  _currentWidget = tab['widget'];
                });
              };

              return _tab(tab["title"], onTabFunction, selected);
            }).toList(),
          ),
        ),
        Expanded(
          child: _currentWidget,
        ),
      ],
    );
  }

  Widget _tab(String title, Function onTap, selected) {
    double borderRadius = 10;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Icfesapp().primaryLight : Icfesapp().grey,
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

  Widget roomList(context) {
    final roomsProvider = RoomsProvider();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.transparent,
      child: FutureBuilder(
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
      ),
    );
  }

  Widget recordedList(context) {
    final prerecordedProvider = PrerecordedProvider();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.transparent,
      child: FutureBuilder(
        future: prerecordedProvider.getPrerecorded(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return RecordedList(
              recorded: snapshot.data,
            );
          } else {
            return Container(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
