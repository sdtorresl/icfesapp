import 'package:flutter/material.dart';
import 'package:icfesapp/models/schedule_model.dart';
import 'package:icfesapp/providers/schedule_provider.dart';

class ListNavegationStatefulWidget extends StatefulWidget {
  ListNavegationStatefulWidget({Key key}) : super(key: key);

  @override
  _ListNavegationStatefulWidgetState createState() =>
      _ListNavegationStatefulWidgetState();
}

class _ListNavegationStatefulWidgetState
    extends State<ListNavegationStatefulWidget> {
  final scheduleProvider = ScheduleModel();
  String dropdownValue;
  String selectedSessions;
  Map<String, String> sessionsMap = new Map();
  String categoryId;
  String searchText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Color.fromRGBO(243, 243, 243, 1),
          ),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: DropdownButtonHideUnderline(
              child: _roomsDropDown(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _roomsDropDown() {
    final scheduleProvider = ScheduleProvider();
    return FutureBuilder(
      future: scheduleProvider.getSchedule(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          List<ScheduleModel> sessions = snapshot.data;
          return DropdownButton(
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            value: dropdownValue,
            autofocus: false,
            onChanged: (newValue) {
              setState(
                () {
                  dropdownValue = newValue;
                  categoryId = sessionsMap[newValue.toString()];
                },
              );
            },
            onTap: () {},
            items: _returnSessions(sessions)
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.caption,
                ),
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  List<String> _returnSessions(List<ScheduleModel> sessionsList) {
    List<String> _stringList = new List();
    sessionsMap = new Map();
    sessionsList.forEach((item) {
      if (!_stringList.contains(item.title)) {
        _stringList.add(item.title);
        sessionsMap[item.title] = item.title;
      }
    });
    _stringList.sort(
      (a, b) => a.toString().compareTo(
            b.toString(),
          ),
    );
    return _stringList;
  }
}
