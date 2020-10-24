import 'package:flutter/material.dart';

import 'package:icfesapp/bloc/provider_bloc.dart';

import 'package:icfesapp/pages/login_page.dart';
import 'package:icfesapp/pages/documents_page.dart';
import 'package:icfesapp/pages/home_page.dart';
import 'package:icfesapp/pages/posters_page.dart';
import 'package:icfesapp/pages/transmission_page.dart';
import 'package:icfesapp/preferences/user_preferences.dart';
import 'package:icfesapp/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(Icfesapp());
}

class Icfesapp extends StatelessWidget {
  final prefs = new UserPreferences();
  Color get accent => Color(0xffe7326e);
  Color get accentLight => Color(0xffff6c9c);
  Color get accentDark => Color(0xffaf0043);
  Color get primary => Color(0xff0074ca);
  Color get primaryLight => Color(0xff5ba2fe);
  Color get primaryDark => Color(0xff004999);
  Color get grey => Color(0xfff3f3f3);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ICFES App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'MontserratLight',
          primaryColor: primary,
          primaryColorLight: primaryLight,
          primaryColorDark: primaryDark,
          accentColor: accent,
          colorScheme: ColorScheme.light(primary: primary, secondary: accent),
          buttonTheme: ButtonThemeData(
            buttonColor: accent,
            disabledColor: accentLight,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 22.0,
                fontFamily: 'PoppinsMedium',
                color: Colors.white,
                fontWeight: FontWeight.bold),
            headline2: TextStyle(
              fontSize: 20.0,
              fontFamily: 'PoppinsMedium',
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
            headline4:
                TextStyle(fontSize: 18.0, fontFamily: 'MontserratRegular'),
            headline5:
                TextStyle(fontSize: 14.0, fontFamily: 'Montserrat Light'),
            bodyText1: TextStyle(
              fontSize: 18.0,
              fontFamily: 'MontserratLight',
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              fontSize: 16.0,
              fontFamily: 'MontserratRegular',
            ),
            subtitle1: TextStyle(
              fontSize: 18.0,
              fontFamily: 'MontserratMedium',
              color: Colors.black26,
            ),
            subtitle2:
                TextStyle(fontSize: 14.0, fontFamily: 'MontserratRegular'),
            caption: TextStyle(
              fontSize: 25.0,
              fontFamily: 'MontserratMedium',
              color: Colors.white,
            ),
            button: TextStyle(
              fontSize: 10.0,
              fontFamily: 'MontserraLight',
            ),
          ),
        ),
        initialRoute: _initialRoute(),
        routes: {
          'home': (BuildContext context) => HomePage(),
          'onboarding': (BuildContext context) => OnboardingPage(),
          'transmission': (context) => TransmissionPage(),
          'documents': (context) => DocumentsPage(),
          'video-posters': (context) => PostersPage(),
          'login': (BuildContext context) => LoginPage(),
        },
      ),
    );
  }

  String _initialRoute() {
    if (prefs.onboardingViewed == true) {
      if (prefs.token != null) {
        return 'home';
      } else {
        return 'login';
      }
    } else {
      return 'onboarding';
    }
  }
}
