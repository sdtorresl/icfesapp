import 'package:flutter/material.dart';

final estiloTexto = new TextStyle(fontSize: 25);
final estiloTexto2 = new TextStyle(fontSize: 18);

class Documents extends StatelessWidget {
  const Documents({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _topBar(context),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _kit(),
            SizedBox(height: 1.0),
            _security(),
            SizedBox(height: 5.0),
            _document(),
            SizedBox(height: 1.0),
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

Widget _kit() {
  return Card(
    elevation: 1.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0)),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.insert_drive_file, color: Colors.black26),
          onLongPress: () {},
          title: Text(
              'Descarga el kit de                                         Documentos',
              style: estiloTexto2),
        ),
      ],
    ),
  );
}

Widget _security() {
  return Card(
    elevation: 1.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0)),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.insert_drive_file, color: Colors.black26),
          onLongPress: () {},
          title: Text('Políticas de seguridad en                     Internet',
              style: estiloTexto2),
        ),
      ],
    ),
  );
}

Widget _document() {
  return Card(
    elevation: 1.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0)),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.insert_drive_file, color: Colors.black26),
          onLongPress: () {},
          title: Text('Políticas de seguridad en                     Internet',
              style: estiloTexto2),
        ),
      ],
    ),
  );
}
