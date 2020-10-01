import 'package:flutter/material.dart';

class ExpansionCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final Image picture;
  final Function() onChanged;

  const ExpansionCard(
      {Key key, this.title, this.subtitle, this.picture, this.onChanged})
      : super(key: key);

  @override
  _ExpansionCardState createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ExpansionTile(
          trailing: _expanded
              ? Icon(
                  Icons.remove_circle_outline,
                  color: Colors.pink,
                )
              : Icon(
                  Icons.add_circle_outline,
                  color: Colors.pink,
                ),
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline3,
          ),
          subtitle: Text(
            widget.subtitle, /*  style: textstyle5 */
          ),
          children: <Widget>[
            widget.picture,
          ],
          onExpansionChanged: (changed) {
            setState(() {
              _expanded = changed;
            });
            if (widget.onChanged != null) {
              widget.onChanged.call();
            }
          },
          initiallyExpanded: _expanded,
        ),
      ),
    );
  }
}
