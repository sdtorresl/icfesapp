import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icfesapp/common/expansion_card.dart';

final textstyle = new TextStyle(fontSize: 25, color: Colors.white);
final textstyle2 = new TextStyle(fontSize: 18, color: Colors.white);
final textstyle3 = new TextStyle(fontSize: 18, color: Colors.black);
final textstyle4 = new TextStyle(fontSize: 20, color: Colors.black);
final textstyle5 = new TextStyle(fontSize: 16, color: Colors.black45);

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _topBar(context),
      body: Container(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.pink[300]),
            title: Text(
              'Home',
              style: textstyle3,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline, color: Colors.black54),
            title: Text(
              'Salas',
              style: textstyle3,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today, color: Colors.black54),
            title: Text(
              'Secciones',
              style: textstyle3,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, color: Colors.black54),
            title: Text(
              'Mas',
              style: textstyle3,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _createButtons(),
    );
  }

  Widget _topBar(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double barHeight = 100;
    return PreferredSize(
      preferredSize: Size(screenWidth, barHeight),
      child: Container(
        child: Stack(
          children: [
            Container(
              width: 500,
              height: 500,
              padding: EdgeInsets.all(10),
              child: SafeArea(
                child: Image.asset("assets/img/Group 101.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _createButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      SizedBox(
        width: 180,
      ),
      FloatingActionButton(
          backgroundColor: (Colors.pinkAccent),
          elevation: 5.0,
          child: Icon(
            Icons.video_call,
            color: Colors.white,
          ),
          onPressed: () {}),
      Expanded(
        child: SizedBox(
          width: 40.0,
        ),
      ),
    ],
  );
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

/* child: Text(
      "Dias  Horas  Minutos",
      style: textstyle3,
    ),*/

Widget _national(context) {
  return Card(
    child: Padding(
      padding: EdgeInsets.only(
        top: 25,
        left: 26,
        right: 27,
        bottom: 1,
      ),
      child: ExpansionTile(
        trailing: Icon(
          Icons.add_circle_outline,
          color: Colors.pink,
        ),
        title: Text(
          'Penalistas nacionales',
          style: textstyle3,
        ),
        subtitle: Text('Transformación de la eduacuón', style: textstyle5),
        children: <Widget>[
          Image.asset('assets/img/sem2020.png'),
        ],
      ),
    ),
  );
}
