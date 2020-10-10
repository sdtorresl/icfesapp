import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _iconExit(context),
            SizedBox(height: 125),
            _onboardingTitle(context),
            SizedBox(height: 18),
            _descriptionContent(context),
            SizedBox(height: 28),
            _imageContent(context),
            SizedBox(height: 28),
            _lessButton(),
          ],
        ),
      ),
    );
  }
}

Widget _iconExit(context) {
  return Container(
    padding: EdgeInsets.only(left: 350),
    child: Icon(
      Icons.clear,
      color: Colors.black45,
    ),
  );
}

Widget _onboardingTitle(context) {
  return Container(
    child: Center(
      child: Text(
        'Consulta todo sobre el evento',
        textAlign: TextAlign.left,
        style:
            Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
      ),
    ),
  );
}

Widget _descriptionContent(context) {
  return Container(
    child: Center(
      child: Text(
        'Disfruta de la nueva plataforma que te  ayudara a crecer',
        style:
            Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black),
      ),
    ),
  );
}

Widget _imageContent(context) {
  return Container(
    child: Image.asset("assets/img/Bitmap.png"),
  );
}

Widget _lessButton() {
  return Container(
    width: 400,
    margin: EdgeInsets.only(bottom: 10),
    child: FloatingActionButton(
      elevation: 5.0,
      child: Icon(
        Icons.navigate_next,
        color: Colors.white,
      ),
      onPressed: () {},
    ),
  );
}
