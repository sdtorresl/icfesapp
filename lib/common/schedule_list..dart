import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/models/schedule_model.dart';
import 'package:icfesapp/utils/date_formatter.dart';

class ScheduleList extends StatelessWidget {
  final List<ScheduleModel> schedules;

  ScheduleList({@required this.schedules});

  String get picture => null;
  @override
  Widget build(BuildContext context) {
    final String _baseUrl = GlobalConfiguration().getValue("api_url");

    return ListView.builder(
      itemCount: schedules.length,
      itemBuilder: (context, index) {
        String _pictureUrl = _baseUrl + schedules[index].picture;
        return ExpansionCard(
          header: DateFormatter.dateTimeToString(schedules[index].startDate),
          title: schedules[index].title,
          subtitle: schedules[index].description,
          hidden: CachedNetworkImage(
            imageUrl: _pictureUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        );
      },
    );
  }
}
