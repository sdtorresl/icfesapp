import 'package:flutter/material.dart';

class ExpansionCard extends StatefulWidget {
  final String header;
  final String title;
  final String subtitle;
  final Widget haddin;
  final Function() onChanged;

  const ExpansionCard({
    Key key,
    @required this.header,
    @required this.title,
    @required this.subtitle,
    @required this.haddin,
    this.onChanged,
  })  : assert(title != null),
        assert(header != null),
        assert(subtitle != null),
        super(key: key);

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
            widget.header,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Colors.black,
                ),
          )
        ],
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      children: <Widget>[widget.haddin],
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
