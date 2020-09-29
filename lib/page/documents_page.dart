import 'package:flutter/material.dart';

final textStyle = new TextStyle(fontSize: 25, color: Colors.black);
final textStyle2 = new TextStyle(fontSize: 18, color: Colors.black);

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _topBar(context),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _titleMain(),
            SizedBox(height: 20),
            _downloads(),
            SizedBox(height: 10),
            _segurityPolitics(),
            SizedBox(height: 1.0),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.pink[300]),
              title: Text(
                'Home',
                style: textStyle2,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline, color: Colors.black54),
              title: Text(
                'Salas',
                style: textStyle2,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.today, color: Colors.black54),
              title: Text(
                'Secciones',
                style: textStyle2,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz, color: Colors.black54),
              title: Text(
                'Mas',
                style: textStyle2,
              ),
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

Widget _titleMain() {
  return Container(
      child: Column(
    children: <Widget>[
      Container(padding: EdgeInsets.all(5)),
      Align(
        alignment: Alignment(-0.9, 0.2),
        child: Text(
          'Documentos',
          style: textStyle,
        ),
      ),
    ],
  ));
}

Widget _downloads() {
  return Card(
    elevation: 1.0,
    child: Column(
      children: <Widget>[
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          leading: Icon(Icons.insert_drive_file, color: Colors.black26),
          onLongPress: () {},
          title: Text(
              'Descarga el kit de                                         Documentos',
              style: textStyle2),
        ),
      ],
    ),
  );
}

Widget _segurityPolitics() {
  return Card(
    elevation: 1.0,
    child: Column(
      children: <Widget>[
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          leading: Icon(Icons.insert_drive_file, color: Colors.black26),
          onLongPress: () {},
          title: Text(
              'Descarga el kit de                                         Documentos',
              style: textStyle2),
        ),
      ],
    ),
  );
}
