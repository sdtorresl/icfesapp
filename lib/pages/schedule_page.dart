import 'package:flutter/material.dart';

import 'package:icfesapp/common/schedule_list..dart';
import 'package:icfesapp/main.dart';
import 'package:icfesapp/models/room_model.dart';
import 'package:icfesapp/models/schedule_model.dart';
import 'package:icfesapp/providers/rooms_provider.dart';
import 'package:icfesapp/providers/schedule_provider.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int _selectedRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 25, top: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Agenda',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Colors.black,
                      ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Selecciona la sala ',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Icfesapp().grey),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButtonHideUnderline(
                    child: _roomsDropdown(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
              color: Icfesapp().grey,
              child: _listSchedule(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _roomsDropdown() {
    final roomsProvider = RoomsProvider();
    return FutureBuilder(
      future: roomsProvider.getRooms(),
      builder: (BuildContext context, AsyncSnapshot<List<RoomModel>> snapshot) {
        if (snapshot.hasData) {
          List<RoomModel> rooms = snapshot.data;
          return DropdownButton(
            isExpanded: true,
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            value: _selectedRoom,
            autofocus: false,
            onChanged: (newValue) {
              setState(
                () {
                  _selectedRoom = newValue;
                  print(_selectedRoom);
                },
              );
            },
            onTap: () {},
            items: rooms.map<DropdownMenuItem<int>>((RoomModel room) {
              return DropdownMenuItem<int>(
                value: room.id,
                child: Text(
                  room.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.black),
                ),
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _listSchedule(context) {
    final scheduleProvider = ScheduleProvider();

    return FutureBuilder(
      future: scheduleProvider.getSchedule(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ScheduleModel>> snapshot) {
        if (snapshot.hasData) {
          List<ScheduleModel> schedules;
          if (_selectedRoom != null) {
            schedules = snapshot.data
                .where((element) => (element.room == _selectedRoom.toString()))
                .toList();
          } else {
            schedules = snapshot.data;
          }

          return ScheduleList(schedules: schedules);
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
