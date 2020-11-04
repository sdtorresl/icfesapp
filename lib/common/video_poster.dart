import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PosterView extends StatefulWidget {
  final String video;
  final String title;
  final String subtitle;
  final String attachment;

  const PosterView({
    Key key,
    @required this.video,
    @required this.title,
    @required this.subtitle,
    this.attachment,
  });

  @override
  _PosterViewState createState() => _PosterViewState();
}

class _PosterViewState extends State<PosterView> {
  @override
  Widget build(BuildContext context) {
    if (widget.video == null || widget.video == "" || widget.video == "false") {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text("No se pudo cargar el poster"),
        ),
      );
    }
    print(widget.video);

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.video),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    var expansionTile = ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 1,
                  heightFactor: 1,
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controller,
                    ),
                    builder: (context, player) {
                      return Column(
                        children: [
                          player,
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: Text(
              widget.title,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
        ],
      ),
      subtitle: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.subtitle,
              textAlign: TextAlign.justify,
              style:
                  Theme.of(context).textTheme.headline5.copyWith(fontSize: 16),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            InkWell(
              onTap: () => _downloadAttachment(widget.attachment),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Descargar',
                    style: Theme.of(context).textTheme.headline2.copyWith(
                        color: Colors.pink,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  FaIcon(FontAwesomeIcons.cloudDownloadAlt, color: Colors.pink),
                  Padding(
                    padding: EdgeInsets.all(19),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: expansionTile,
      ),
    );
  }

  void _downloadAttachment(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
