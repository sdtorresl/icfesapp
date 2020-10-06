import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icfesapp/common/expansion_card.dart';

final textstyle3 = new TextStyle(fontSize: 18, color: Colors.black);

class LobbyPage extends StatelessWidget {
  const LobbyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _mainstart(context),
          _mainTitle(context),
          _watch(context),
          SizedBox(height: 30.0),
          ExpansionCard(
            title: "Ejemplo",
            subtitle: "Ejemplo subtítulo",
            picture: Image.asset('assets/img/sem2020.png'),
          ),
          ExpansionCard(
            title: "Ejemplo",
            subtitle: "Ejemplo subtítulo",
            picture: Image.asset('assets/img/sem2020.png'),
          ),
          ExpansionCard(
            title: "Ejemplo",
            subtitle: "Ejemplo subtítulo",
            picture: Image.asset('assets/img/sem2020.png'),
          ),
          ExpansionCard(
            title: "Ejemplo",
            subtitle: "Ejemplo subtítulo",
            picture: Image.asset('assets/img/sem2020.png'),
          ),
        ],
      ),
    );
  }
}

Widget _mainstart(context) {
  final card = Container(
    child: Column(
      children: <Widget>[
        Container(padding: EdgeInsets.all(25)),
        Center(
            child: Text(
          'Titulo',
          style: Theme.of(context).textTheme.headline1,
        )),
        Container(
          padding: EdgeInsets.all(16),
        ),
        new Image.asset('assets/img/Group 6.png'),
        Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
              style: Theme.of(context).textTheme.bodyText1,
            ))
      ],
    ),
  );
  return Container(
    decoration: new BoxDecoration(
      image: new DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/img/Group 194.png"),
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: card,
    ),
  );
}

Widget _mainTitle(context) {
  return Container(
    padding: EdgeInsets.all(24),
    child: Text(
      "Empieza nuestro conteo para el evento",
      style: Theme.of(context).textTheme.headline2,
    ),
  );
}

Widget _watch(context) {
  return Column(
    children: [
      Container(
        child: Row(
          children: <Widget>[
            Positioned(
              child: Container(
                height: 100.0,
                width: 120.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Column(
                        children: [
                          Container(
                            height: 70.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 5, color: Colors.blue),
                                shape: BoxShape.circle,
                                color: Colors.lightBlue[900]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '03',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 100.0,
                width: 120.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        height: 70.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            border: Border.all(width: 5, color: Colors.blue),
                            shape: BoxShape.circle,
                            color: Colors.lightBlue[900]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '72',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 100.0,
                width: 120.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        height: 70.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.blue),
                          shape: BoxShape.circle,
                          color: Colors.lightBlue[900],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '00',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
