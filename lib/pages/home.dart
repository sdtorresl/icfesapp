import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final estiloTexto = new TextStyle(fontSize: 25);

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _topBar(context),
        body: Container(
          child: Text("Hola mundo cruel", style: estiloTexto),
        ),
        //bottomNavigationBar: BottomNavigationBar(items: null),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _crearBotones());
  }

  Widget _topBar(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double barHeight = 90;

    return PreferredSize(
      preferredSize: Size(screenWidth, barHeight),
      child: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: SafeArea(
                child: Image.asset("assets/img/logo_icfes.png"),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                ),
                padding: EdgeInsets.only(left: 50, top: 20),
                width: 100,
                height: 100,
                child: SafeArea(
                  child: FaIcon(FontAwesomeIcons.commentDots),
                ),
              ),
            )
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
            elevation: 50.0,
            child: Icon(
              Icons.videocam_off,
              color: Colors.white,
            ),
            onPressed: null),
        Expanded(
            child: SizedBox(
          width: 20.0,
        )),
        //SizedBox(width: 20.0),
      ],
    );
  }
}
