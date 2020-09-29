import 'package:flutter/material.dart';
import 'package:icfesapp/common/document_download.dart';

final textStyle = new TextStyle(fontSize: 25, color: Colors.black);
final textStyle2 = new TextStyle(fontSize: 18, color: Colors.black);

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _topBar(context),
        body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _mainTitle(),
              SizedBox(height: 20),
              Expanded(
                child: _listDocuments(),
              )
            ],
          ),
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

  Widget _listDocuments() {
    return ListView(
      children: <Widget>[
        DocumentDownload(
          title: "Descarga el kit de documentos",
          icon: Icons.dashboard,
          url: "http://",
        ),
        DocumentDownload(
          title: "Descarga el kit de documentos",
          icon: Icons.insert_drive_file,
          url: "http://",
        ),
        DocumentDownload(
          title: "Descarga el kit de documentos",
          icon: Icons.dashboard,
          url: "http://",
        ),
        DocumentDownload(
          title: "Descarga el kit de documentos",
          icon: Icons.dashboard,
          url: "http://",
        ),
      ],
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

  Widget _mainTitle() {
    return Container(
      child: Text(
        "Documentos",
        style: textStyle,
      ),
    );
  }
}
