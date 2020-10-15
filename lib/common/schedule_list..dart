import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/models/schedule_model.dart';
import 'package:icfesapp/utils/date_formatter.dart';

class ScheduleList extends StatelessWidget {
  final List<ScheduleModel> schedules;

  ScheduleList({@required this.schedules});

  String get picture => null;
  @override
  Widget build(BuildContext context) {
    const String _baseUrl = "https://dev-eweb.us.seedcloud.co";
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          String _pictureUrl = _baseUrl + schedules[index].picture;
          return ExpansionCard(
            starDate:
                DateFormatter.dateTimeToString(schedules[index].startDate),
            title: schedules[index].title,
            subtitle: schedules[index].description,
            picture: CachedNetworkImage(
              imageUrl: _pictureUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }
}
