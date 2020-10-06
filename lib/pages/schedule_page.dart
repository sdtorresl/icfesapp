import 'package:flutter/material.dart';
import 'package:icfesapp/common/rooms_dropdown.dart';

import 'package:icfesapp/common/schedule_list..dart';
import 'package:icfesapp/providers/schedule_provider.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Agenda',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Colors.black,
                      ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Selecciona la sala ',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ListNavegationStatefulWidget(),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(child: _listSchedule(context))
        ],
      ),
    );
  }
}

final scheduleProvider = ScheduleProvider();
Widget _listSchedule(context) {
  Container(
    decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
  );
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
    },
  );
}
