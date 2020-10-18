import 'package:flutter/material.dart';
import 'package:icfesapp/bloc/login_bloc.dart';
import 'package:icfesapp/bloc/provider_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 64.0),
          _mainImage(context),
          SizedBox(height: 30),
          _mainTitle(context),
          SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            child: _mailAddress(bloc),
          ),
          SizedBox(height: 5),
          Container(
            alignment: Alignment.center,
            child: _enderCode(bloc),
          ),
          SizedBox(height: 20),
          Text('¿Olvidó su codigó?', textAlign: TextAlign.center),
          SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            child: _buttonSignUp(bloc),
          ),
          SizedBox(height: 50),
          _icfesImage(),
        ],
      ),
    );
  }

  Widget _mainImage(context) {
    return Container(
      child: SafeArea(
        child: Image.asset("assets/img/Group 103.png"),
      ),
    );
  }

  Widget _mainTitle(context) {
    return Text(
      '¡Bienvenido! ingresar a nuestro evento',
      textAlign: TextAlign.center,
      style:
          Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
    );
  }

  Widget _mailAddress(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                  decoration: InputDecoration(
                    hintText: "Excribe  tu correo electronico",
                    counterText: snapshot.data,
                    errorText: snapshot.data,
                  ),
                  onChanged: bloc.changeEmail,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _enderCode(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                  decoration: InputDecoration(
                    hintText: "Excribe tu codigo",
                    counterText: snapshot.data,
                    errorText: snapshot.error,
                    fillColor: Colors.black12,
                  ),
                  onChanged: bloc.changeEmail,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buttonSignUp(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final size = MediaQuery.of(context).size;
        return Container(
          child: SizedBox(
            width: size.width * 0.9,
            height: size.width * 0.15,
            child: RaisedButton(
              color: Colors.pink,
              onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
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
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    print('================');
    print('Email: ${bloc.email}');
    print('Password: ${bloc.password}');
    print('================');

    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _icfesImage() {
    return Container(
      child: Image.asset("assets/img/Group 42.png"),
    );
  }
}
