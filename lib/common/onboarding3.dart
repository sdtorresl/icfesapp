import 'package:flutter/material.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({Key key}) : super(key: key);

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
            SizedBox(height: 35),
            _lessPoint(context),
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
        'Tu espacio virtual',
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
        'Conectate y observa el evento a través de tu celular',
        textAlign: TextAlign.center,
        style:
            Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black),
      ),
    ),
  );
}

Widget _imageContent(context) {
  return Container(
    child: Image.asset("assets/img/Onboarding@1x.png"),
  );
}

Widget _lessButton() {
  return Container(
    width: 400,
    margin: EdgeInsets.only(bottom: 10),
    child: FloatingActionButton(
      elevation: 5.0,
      child: Center(
        child: Icon(
          Icons.navigate_next,
          color: Colors.white,
        ),
      ),
      onPressed: () {},
    ),
  );
}

Widget _lessPoint(context) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 20,
            width: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pink, width: 2),
            ),
          ),
          Container(
            height: 20,
            width: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pink, width: 2),
            ),
          ),
          Container(
            height: 20,
            width: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pink, width: 10),
            ),
          ),
        ],
      ),
    ),
  );
}
