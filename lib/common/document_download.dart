import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentDownload extends StatefulWidget {
  final String title;
  final String description;
  final String type;
  final String url;
  final Function() onChanged;

  const DocumentDownload({
    Key key,
    @required this.title,
    @required this.description,
    @required this.type,
    @required this.url,
    this.onChanged,
  })  : assert(title != null),
        assert(description != null),
        assert(type != null),
        assert(url != null),
        super(key: key);

  @override
  _DocumentDownloadState createState() => _DocumentDownloadState();
}

class _DocumentDownloadState extends State<DocumentDownload> {
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
      leading: FaIcon(FontAwesomeIcons.filePdf, size: 40),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Colors.black,
                ),
          )
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.type,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          RaisedButton(
            onPressed: _launchURL,
            child: Text('Descargas',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white)),
            color: Colors.pink,
          ),
        ],
      ),
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
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: expansionTile,
      ),
    );
  }

  _launchURL() async {
    const url = '';
    if (await canLaunch(widget.url)) {
      await launch(widget.url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
