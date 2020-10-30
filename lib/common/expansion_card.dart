import 'package:flutter/material.dart';
import 'package:icfesapp/main.dart';

class ExpansionCard extends StatefulWidget {
  final String header;
  final String title;
  final String subtitle;
  final Widget hidden;
  final Function() onChanged;
  final bool highlight;

  const ExpansionCard({
    Key key,
    this.header,
    this.subtitle,
    @required this.title,
    @required this.hidden,
    this.onChanged,
    this.highlight = false,
  })  : assert(title != null),
        super(key: key);

  @override
  _ExpansionCardState createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    Color textColor = widget.highlight ? Colors.white : Colors.black;
    Color iconColor = widget.highlight ? Colors.white : IcfesApp().accent;

    List<Widget> headerItems;
    if (widget.header != null) {
      headerItems = <Widget>[
        Text(
          widget.header,
          style:
              Theme.of(context).textTheme.headline5.copyWith(color: textColor),
        ),
        SizedBox(height: 4),
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headline4.copyWith(
                color: textColor,
              ),
        )
      ];
    } else {
      headerItems = <Widget>[
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headline4.copyWith(
                color: textColor,
              ),
        )
      ];
    }

    var expansionTile = ExpansionTile(
      trailing: _expanded
          ? Icon(
              Icons.remove_circle_outline,
              color: iconColor,
            )
          : Icon(
              Icons.add_circle_outline,
              color: iconColor,
            ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: headerItems,
      ),
      subtitle: widget.subtitle != null
          ? Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                widget.subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: textColor),
              ),
            )
          : null,
      children: <Widget>[widget.hidden],
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: widget.highlight ? IcfesApp().primaryLight : Colors.white,
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: expansionTile,
      ),
    );
  }
}
