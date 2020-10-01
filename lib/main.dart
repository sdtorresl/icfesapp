import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:icfesapp/page/home_page.dart';

void main() {
  runApp(IcfesApp());
}

class IcfesApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICFES App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //

        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
