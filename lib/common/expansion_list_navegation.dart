import 'package:flutter/material.dart';

class ListNavegationStatefulWidget extends StatefulWidget {
  ListNavegationStatefulWidget({Key key}) : super(key: key);

  @override
  _ListNavegationStatefulWidgetState createState() =>
      _ListNavegationStatefulWidgetState();
}

class _ListNavegationStatefulWidgetState
    extends State<ListNavegationStatefulWidget> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: DropdownButton(
        value: _value,
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        items: [
          DropdownMenuItem(
            child: Text("Sala Colombia investiga"),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("Enlace a sesiones"),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text("Enlace a sesiones 2"),
            value: 3,
          ),
          DropdownMenuItem(
            child: Text("Enlace a sesiones 3"),
            value: 4,
          ),
        ],
        onChanged: (value) {
          setState(
            () {
              _value = value;
            },
          );
        },
      ),
    );
  }
}
