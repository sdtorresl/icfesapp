import 'package:flutter/material.dart';
import 'package:icfesapp/bloc/login_bloc.dart';
import 'package:icfesapp/bloc/provider_bloc.dart';
import 'package:icfesapp/models/user_model.dart';
import 'package:icfesapp/providers/user_provider.dart';
import 'package:icfesapp/utils/alert_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

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
              height: 70,
            ),
          ),
          Container(
            width: size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: _mainImage(context),
                  alignment: Alignment.center,
                ),
                SizedBox(height: 30),
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
                _emailField(bloc),
                SizedBox(height: 30.0),
                Text(
                  'Código',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.black),
                ),
                _passwordField(bloc),
                SizedBox(height: 30.0),
                Container(
                  child: _createButton(bloc),
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
      height: 200,
      child: Image.asset("assets/img/icfes_app.png"),
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

  Widget _emailField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
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

  Widget _passwordField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          obscureText: _isPasswordHidden,
          decoration: InputDecoration(
              hintText: "Ingresa el código que recibiste",
              errorText: snapshot.error,
              errorStyle: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.red),
              suffixIcon: IconButton(
                icon: Icon(_isPasswordHidden
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: _toggleVisibility,
              )),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget _createButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final size = MediaQuery.of(context).size;
        return RaisedButton(
          child: Container(
            width: size.width * 0.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingresar',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white),
                ),
                Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.yellow[600],
                )
              ],
            ),
          ),
          color: Colors.pink,
          disabledTextColor: Colors.grey,
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
        );
      },
    );
  }

  Widget _icfesImage() {
    return Container(
      child: Image.asset("assets/img/Group 42.png"),
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {
    UserProvider userProvider = UserProvider();
    UserModel user = await userProvider.login(bloc.email, bloc.password);

    if (user != null) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      showMyDialog(
        context,
        "Error",
        Text("El correo o el código no son válidos, intenta nuevamente."),
      );
    }
  }
}
