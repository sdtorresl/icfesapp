import 'package:flutter/material.dart';
import 'package:icfesapp/common/expansion_list_navegation.dart';
import 'package:icfesapp/common/list_schedule_widget.dart';
import 'package:icfesapp/providers/schedule_provider.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          _principalTile(context),
          SizedBox(height: 30.0),
          _titleSchedule(context),
          ExpansionList(),
          _listSchedule(context),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}

Widget _principalTile(context) {
  return Container(
      child: Text(
    'Agenda',
    style: Theme.of(context).textTheme.headline2,
  ));
}

Widget _titleSchedule(context) {
  return Container(
      child: Text(
    'Selecciona la sala ',
    style: Theme.of(context).textTheme.headline4,
  ));
}

final scheduleProvider = ScheduleProvider();
Widget _listSchedule(context) {
  return FutureBuilder(
      future: scheduleProvider.getSchedule(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return ScheduleList(schedules: snapshot.data);
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      });
}
