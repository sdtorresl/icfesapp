import 'package:flutter/material.dart';
import 'package:icfesapp/bloc/login_bloc.dart';
import 'package:icfesapp/bloc/provider_bloc.dart';
import 'package:icfesapp/providers/user_provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 64,
            ),
          ),
          Container(
            width: size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: _mainImage(context),
                  alignment: Alignment.center,
                ),
                SizedBox(height: 40),
                Container(
                  child: _mainTitle(context),
                  alignment: Alignment.center,
                ),
                SizedBox(height: 40),
                Text(
                  'Correo electrónico',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.black),
                ),
                _crearEmail(bloc),
                SizedBox(height: 30.0),
                Text(
                  'Código',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.black),
                ),
                _crearPassword(bloc),
                SizedBox(height: 30.0),
                Container(
                  child: _forgottenCode(context),
                  alignment: Alignment.center,
                ),
                SizedBox(height: 30.0),
                Container(
                  child: _crearBoton(bloc),
                  alignment: Alignment.bottomCenter,
                ),
                SizedBox(height: 50),
                Container(
                  child: _icfesImage(),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainImage(context) {
    return Container(
      child: Image.asset("assets/img/Group 103.png"),
    );
  }

  Widget _mainTitle(context) {
    return Text(
      '¡Bienvenido! ingresa a nuestro evento',
      textAlign: TextAlign.center,
      style:
          Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
    );
  }

  Widget _forgottenCode(context) {
    return Text(
      '¿Olvido su contraseña?',
      textAlign: TextAlign.center,
      style:
          Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Escribe tu correo electrónico',
              errorText: snapshot.error,
              errorStyle: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.red),
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              errorText: snapshot.error,
              errorStyle: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.red),
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final size = MediaQuery.of(context).size;
        return RaisedButton(
            child: Container(
              width: size.width * 0.5,
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
                  SizedBox(width: 100),
                  Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.yellow[600],
                  )
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: Colors.pink,
            textColor: Colors.white,
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null);
      },
    );
  }

  Widget _icfesImage() {
    return Container(
      child: Image.asset("assets/img/Group 42.png"),
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    print('================');
    print('Email: ${bloc.email}');
    print('Password: ${bloc.password}');
    print('================');

    UserProvider userProvider = UserProvider();
    userProvider.login(bloc.email, bloc.password);

    //Navigator.pushReplacementNamed(context, 'home');
  }
}
