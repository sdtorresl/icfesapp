import 'package:flutter/material.dart';

final estiloTexto = new TextStyle(fontSize: 25);
final estiloTexto2 = new TextStyle(fontSize: 18);

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
            SizedBox(height: 5.0),
            _reloj(),
            SizedBox(height: 50.0),
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
              icon: new Icon(
                Icons.calendar_view_day,
                color: Colors.pink,
              ),
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
          elevation: 10.0,
          child: Icon(
            Icons.video_call,
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
        Center(
            child: Text(
          'Titulo',
          style: estiloTexto,
        )),
        Container(
          padding: EdgeInsets.all(10),
        ),
        new Image.asset('assets/img/Group 6.png'),
        Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
              style: estiloTexto2,
            ))
      ],
    ),
  );

  return Container(
    decoration: new BoxDecoration(
        image: new DecorationImage(
      fit: BoxFit.fitHeight,
      image: AssetImage(
        "assets/img/Group 194.png",
      ),
    )),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: card,
    ),
  );
}

Widget _reloj() {
  Container(
      child: Column(
    children: <Widget>[
      Text('Empieza nuestro conteo para el evento'),
      Container(
          padding: EdgeInsets.all(0),
          child: Text(
            'uuu',
          ))
    ],
  ));
  return Container(
      child: Row(
    children: <Widget>[
      Positioned(
        child: Container(
          height: 100.0,
          width: 150.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 25.0,
                child: Container(
                  height: 70.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.blueGrey),
                      shape: BoxShape.circle,
                      color: Colors.blue),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '03',
                        style: estiloTexto,
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
          width: 130.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 25.0,
                child: Container(
                  height: 70.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.blueGrey),
                      shape: BoxShape.circle,
                      color: Colors.blue),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '72',
                        style: estiloTexto,
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
          width: 100.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 25.0,
                child: Container(
                  height: 70.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.blueGrey),
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '00',
                        style: estiloTexto,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ],
  ));
}

Widget _cardTipo2() {
  return Card(
    elevation: 1.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0)),
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
