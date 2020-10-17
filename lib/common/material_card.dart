import 'package:flutter/material.dart';

class MaterialCard extends StatefulWidget {
  final String title;
  final String description;
  final String uploadDate;
  final String videoCode;
  final Function() onChanged;

  const MaterialCard({
    Key key,
    @required this.title,
    @required this.description,
    @required this.uploadDate,
    @required this.videoCode,
    this.onChanged,
  })  : assert(title != null),
        assert(description != null),
        assert(uploadDate != null),
        assert(videoCode != null),
        super(key: key);

  @override
  _MaterialCardState createState() => _MaterialCardState();
}

class _MaterialCardState extends State<MaterialCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    var expansionTile = ExpansionTile(
      trailing: _expanded
          ? Icon(
              Icons.remove_circle_outline,
              color: Colors.pink,
            )
          : Icon(
              Icons.add_circle_outline,
              color: Colors.pink,
            ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.uploadDate),
          SizedBox(height: 25),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
      children: <Widget>[
        SizedBox(height: 25),
        Text(
          widget.description,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.black),
        ),
        SizedBox(height: 25),
        Text(
          widget.videoCode,
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
      onExpansionChanged: (changed) {
        setState(
          () {
            _expanded = changed;
          },
        );
        if (widget.onChanged != null) {
          widget.onChanged.call();
        }
      },
      initiallyExpanded: _expanded,
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: expansionTile,
      ),
    );
  }
}
