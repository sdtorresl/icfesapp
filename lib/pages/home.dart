import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _topBar(context),
      body: Container(
        child: Text("Hola mundo cruel"),
      ),
      //bottomNavigationBar: BottomNavigationBar(items: null),
    );
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
}
