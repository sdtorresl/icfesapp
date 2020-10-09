import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icfesapp/models/video_poster_model.dart';
import 'package:vimeoplayer/vimeoplayer.dart';

class DesingPoster extends StatefulWidget {
  final Videos video;
  final String title;
  final String subtitle;

  const DesingPoster({
    Key key,
    @required this.video,
    @required this.title,
    @required this.subtitle,
  });

  @override
  _PosterDesingState createState() => _PosterDesingState();
}

class _PosterDesingState extends State<DesingPoster> {
  @override
  Widget build(BuildContext context) {
    var expansionTile = ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            width: 500,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: VimeoPlayer(id: '461450946'),
            ),
          ),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline2.copyWith(
                  color: Colors.black,
                ),
          )
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.subtitle,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Descargas',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.pink),
              ),
              Padding(padding: EdgeInsets.all(3)),
              FaIcon(FontAwesomeIcons.cloudDownloadAlt, color: Colors.pink),
            ],
          ),
        ],
      ),
    );

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: expansionTile,
      ),
    );
  }
}
