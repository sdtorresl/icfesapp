import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:icfesapp/common/action_button.dart';
import 'package:icfesapp/common/schedule_expansion_card.dart';
import 'package:icfesapp/models/schedule_model.dart';
import 'package:icfesapp/pages/transmission_page.dart';
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
        ScheduleModel schedule = schedules[index];

        String _pictureUrl = _baseUrl + schedule.picture;
        List<Widget> hiddenItems = [
          CachedNetworkImage(
            imageUrl: _pictureUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ];

        if (int.tryParse(schedule.room) != null &&
            schedule.startDate.compareTo(DateTime.now()) <= 0 &&
            schedule.endDate.compareTo(DateTime.now()) >= 0) {
          hiddenItems.add(SizedBox(
            height: 10,
          ));
          hiddenItems.add(
            ActionButton(
              text: "Ver ahora",
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransmissionPage(
                    id: int.tryParse(schedule.room),
                  ),
                ),
              ),
              width: double.infinity,
            ),
          );
        }

        return ScheduleExpansionCard(
          header: DateFormatter.dateTimeToString(schedules[index].startDate),
          title: schedule.title,
          subtitle: schedule.description,
          hidden: Column(
            children: hiddenItems,
          ),
        );
      },
    );
  }
}
