import 'package:flutter/material.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/models/prerecorded_model.dart';
import 'package:icfesapp/pages/recorded_page.dart';
import 'package:icfesapp/pages/transmission_page.dart';
import 'package:icfesapp/utils/date_formatter.dart';

import '../main.dart';

class RecordedList extends StatelessWidget {
  final List<PrerecordedModel> recorded;

  RecordedList({@required this.recorded});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: recorded.length,
        itemBuilder: (context, index) {
          PrerecordedModel record = recorded[index];
          return ExpansionCard(
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
                    color: IcfesApp().accent,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
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
