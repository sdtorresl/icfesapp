import 'package:flutter/material.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/models/prerecorded_model.dart';
import 'package:icfesapp/pages/recorded_page.dart';
import 'package:icfesapp/utils/date_formatter.dart';

import '../main.dart';

class RecordedList extends StatelessWidget {
  final List<PrerecordedModel> recorded;

  RecordedList({@required this.recorded});
  @override
  Widget build(BuildContext context) {
    List<Widget> recordList = List();
    for (var record in recorded) {
      recordList.add(ExpansionCard(
        header: DateFormatter.dateTimeToString(record.uploadDate),
        title: record.title,
        hidden: Column(
          children: [
            Text(
              record.description,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                child: Text(
                  "Ver material",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white),
                ),
                onPressed: () => _openRecord(context, record),
                color: SeminarioInternacional().accent,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ));
    }
    recordList.add(SizedBox(height: 35));

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: ListView(
        children: recordList,
      ),
    );
  }

  _openRecord(BuildContext context, PrerecordedModel record) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordedPage(
          record: record,
        ),
      ),
    );
  }
}
