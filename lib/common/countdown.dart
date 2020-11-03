import 'package:flutter/material.dart';
import 'package:icfesapp/main.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class Countdown extends StatefulWidget {
  final DateTime startDate;
  final String title;

  Countdown({Key key, this.startDate, this.title}) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.7,
      margin: EdgeInsets.only(bottom: 20),
      child: CountdownTimer(
        endTime: widget.startDate.millisecondsSinceEpoch,
        widgetBuilder: (_, CurrentRemainingTime time) {
          int remainingDays = time.days != null ? time.days : 0;
          int remainingHours = time.hours != null ? time.hours : 0;
          int remainingMins = time.min != null ? time.min : 0;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _counterItem(remainingDays.toString(), "Dias"),
              _counterItem(remainingHours.toString(), "Horas"),
              _counterItem(remainingMins.toString(), "Minutos"),
            ],
          );
        },
      ),
    );
  }

  Widget _counterItem(value, title) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: IcfesApp().primary,
            border: Border.all(color: Color(0x00FF32C5FF), width: 5),
          ),
          child: Center(
            child: Text(
              value,
              style: Theme.of(context).textTheme.headline2.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
        Text(title),
      ],
    );
  }
}
