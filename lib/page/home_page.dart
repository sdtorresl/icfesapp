import 'package:flutter/material.dart';

final estiloTexto = new TextStyle(fontSize: 25);

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _topBar(context),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(height: 200.0),
            _cardTipo2(),
            SizedBox(height: 1.0),
            _cardTipo3()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: Colors.pink),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.people_outline, color: Colors.pink),
              title: new Text('Salas'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.calendar_view_day, color: Colors.pink),
              title: new Text('Seciones'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.more_horiz, color: Colors.pink),
              title: new Text('Mas'),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _crearBotones());
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

Widget _crearBotones() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      SizedBox(
        width: 180,
      ),
      FloatingActionButton(
          backgroundColor: (Colors.pinkAccent),
          elevation: 50.0,
          child: Icon(
            Icons.videocam,
            color: Colors.white,
          ),
          onPressed: () {}),
      Expanded(
          child: SizedBox(
        width: 20.0,
      )),
      //SizedBox(width: 20.0),
    ],
  );
}

Widget _cardTipo1() {
  final card = Container(
    child: Column(
      children: <Widget>[
        Center(child: Text('Titulo')),
        new Image.asset('assets/img/Group 6.png'),
        Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
            ))
      ],
    ),
  );
  return Container(
    decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black26,
        blurRadius: 0,
        spreadRadius: 0,
        offset: Offset(0, 0),
      )
    ]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(40.0),
      child: card,
    ),
  );
}

Widget _cardTipo2() {
  return Card(
    elevation: 1.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.add_circle_outline, color: Colors.pink),
          onLongPress: () {},
          title: Text('Penalistas nacionales '),
          subtitle: Text('Transformación de la eduación'),
        ),
      ],
    ),
  );
}

Widget _cardTipo3() {
  return Card(
    elevation: 1.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text('Penalistas internacionales '),
          subtitle: Text('transformación de la educación'),
          leading: Icon(
            Icons.remove_circle_outline,
            color: Colors.pink,
          ),
          onLongPress: () {},
        ),
        new Image.asset('assets/img/sem2020.png'),
      ],
    ),
  );
}
