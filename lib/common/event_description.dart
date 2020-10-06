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
            padding: EdgeInsets.all(20),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          new Image.asset('assets/img/Group 6.png'),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 50),
            padding: EdgeInsets.all(10),
            height: 80,
            child: Text(
              description,
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
