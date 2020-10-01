import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:icfesapp/page/home_page.dart';

void main() {
  runApp(IcfesApp());
}

class IcfesApp extends StatelessWidget {
  final Color purple = Color(0xff9e2aa4);
  final Color yellow = Color(0xffF6C500);
  final Color red = Color(0xFFEA002B);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICFES App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'MontserratLight',
        primaryColor: purple,
        primaryColorLight: Color(0xffd25ed6),
        primaryColorDark: Color(0xff570A5B),
        accentColor: yellow,
        hintColor: Color(0xFF797979),
        buttonColor: red,
        errorColor: red,
        colorScheme: ColorScheme.light(primary: purple, secondary: yellow),
        buttonTheme: ButtonThemeData(
          buttonColor: yellow,
          disabledColor: Color(0x99fff84f),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 20.0, fontFamily: 'Poppins'),
          headline2: TextStyle(fontSize: 19.0, fontFamily: 'Poppins'),
          headline3: TextStyle(fontSize: 18.0, fontFamily: 'Poppins'),
          headline4: TextStyle(fontSize: 17.0, fontFamily: 'Poppins'),
          headline5: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
          bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'MontserratLight'),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          subtitle1: TextStyle(fontSize: 12.0, fontFamily: 'Montserrat'),
          subtitle2: TextStyle(fontSize: 12.0, fontFamily: 'Montserrat'),
          caption: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          button: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
        ),
      ),
      home: HomePage(),
    );
  }
}
