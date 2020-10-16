import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 64.0),
          _imagePrincipal(context),
          SizedBox(height: 30),
          _mainTile(context),
          SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            child: _mailAddress(context),
          ),
          SizedBox(height: 5),
          Container(
            alignment: Alignment.center,
            child: _enderCode(context),
          ),
          SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            child: _buttonEnterokay(context),
          ),
          SizedBox(height: 50),
          _imageIcfes(),
        ],
      ),
    );
  }

  Widget _imagePrincipal(context) {
    return Container(
      child: SafeArea(
        child: Image.asset("assets/img/Group 103.png"),
      ),
    );
  }

  Widget _mainTile(context) {
    return Container(
      child: Text(
        '¡Bienvenido! ingresar a nuestro evento',
        textAlign: TextAlign.center,
        style:
            Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
      ),
    );
  }

  Widget _mailAddress(context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Correo electronico',
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Colors.black),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(235, 235, 235, 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration:
                  InputDecoration(hintText: "Excribe  tu correo electronico"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _enderCode(context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'codigo',
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Colors.black),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(235, 235, 235, 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: "Excribe tu codigo"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonEnterokay(context) {
    return Container(
      child: SizedBox(
        width: 350,
        height: 50,
        child: RaisedButton(
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Ingresar',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.all(90)),
              Icon(
                Icons.arrow_forward_outlined,
                color: Colors.yellow[600],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageIcfes() {
    return Container(
      child: Image.asset("assets/img/Group 42.png"),
    );
  }
}
