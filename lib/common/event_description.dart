import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventDescription extends StatelessWidget {
  final String title;
  final String description;
  final String picture;

  const EventDescription({Key key, this.title, this.description, this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          CachedNetworkImage(
            imageUrl: this.picture,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => SizedBox(
              height: 50,
            ),
          ),
          Container(
            margin: EdgeInsets.all(50),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );

    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/img/Group 194.png"),
        ),
      ),
      child: card,
    );
  }
}
