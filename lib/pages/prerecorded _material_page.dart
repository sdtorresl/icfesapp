import 'package:flutter/material.dart';

import 'package:icfesapp/common/schedule_list..dart';
import 'package:icfesapp/providers/prerecorded_provider.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prerecordedProvider = PrerecordedProvider();
    {
      Container(
        decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
      );
      return FutureBuilder(
        future: prerecordedProvider.getPrerecorded(),
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
  }
}
