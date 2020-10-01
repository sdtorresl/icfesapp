import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icfesapp/common/expansion_card.dart';

final textstyle = new TextStyle(fontSize: 25, color: Colors.white);
final textstyle2 = new TextStyle(fontSize: 18, color: Colors.white);
final textstyle3 = new TextStyle(fontSize: 18, color: Colors.black);
final textstyle4 = new TextStyle(fontSize: 20, color: Colors.black);
final textstyle5 = new TextStyle(fontSize: 16, color: Colors.black45);

class LobbyPage extends StatelessWidget {
  const LobbyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _mainstart(),
          _mainTitle(),
          _watch(),
          _dateWatch(),
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

Widget _mainstart() {
  final card = Container(
    child: Column(
      children: <Widget>[
        Container(padding: EdgeInsets.all(25)),
        Center(child: Text('Titulo', style: textstyle)),
        Container(
          padding: EdgeInsets.all(16),
        ),
        new Image.asset('assets/img/Group 6.png'),
        Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
              style: textstyle2,
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

Widget _mainTitle() {
  return Container(
    padding: EdgeInsets.all(24),
    child: Text(
      "Empieza nuestro conteo para el evento",
      style: textstyle4,
    ),
  );
}

Widget _watch() {
  return Container(
    child: Row(
      children: <Widget>[
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
                          '03',
                          style: textstyle,
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
                        color: Colors.lightBlue[900]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '72',
                          style: textstyle,
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
                          style: textstyle,
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
  );
}

Widget _dateWatch() {
  return Container(
    child: Row(
      children: <Widget>[
        Positioned(
          child: Container(
            height: 100.0,
            width: 120.0,
            child: Stack(
              children: <Widget>[
                Text(
                  'dias',
                  style: textstyle3,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
