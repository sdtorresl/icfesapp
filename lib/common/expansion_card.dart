import 'package:flutter/material.dart';

class ExpansionCard extends StatefulWidget {
  final String starDate;
  final String title;
  final String subtitle;
  final Widget picture;
  final Function() onChanged;

  const ExpansionCard({
    Key key,
    this.starDate,
    this.title,
    this.subtitle,
    this.picture,
    this.onChanged,
  }) : super(key: key);

  @override
  _ExpansionCardState createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
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
          Text(
            widget.starDate,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline2,
          )
        ],
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      children: <Widget>[widget.picture],
      onExpansionChanged: (changed) {
        setState(() {
          _expanded = changed;
        });
        if (widget.onChanged != null) {
          widget.onChanged.call();
        }
      },
      initiallyExpanded: _expanded,
    );
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: expansionTile,
      ),
    );
  }
}
