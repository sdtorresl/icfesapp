import 'package:flutter/material.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/models/prerecorded_model.dart';
import 'package:icfesapp/utils/date_formatter.dart';

class RedordedList extends StatelessWidget {
  final List<PrerecordedModel> redorded;

  RedordedList({@required this.redorded});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: redorded.length,
        itemBuilder: (context, index) {
          return ExpansionCard(
            header: DateFormatter.dateTimeToString(redorded[index].uploadDate),
            title: redorded[index].title,
            subtitle: '',
            hidden: Column(
              children: [
                Text(
                  redorded[index].description,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  redorded[index].videoCode,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Colors.black,
                      ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
