import 'package:flutter/material.dart';

class DesingPoster extends StatefulWidget {
  final String videos;
  final String title;
  final String subtitle;
  final String icon;
  final Function() onChanged;

  const DesingPoster({
    Key key,
    @required this.videos,
    @required this.title,
    @required this.subtitle,
    @required this.icon,
    this.onChanged,
  })  : assert(videos != null),
        assert(title != null),
        assert(subtitle != null),
        super(key: key);

  @override
  _DesingPosterState createState() => _DesingPosterState();
}

class _DesingPosterState extends State<DesingPoster> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    var expansionTile = ExpansionTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
