import 'package:flutter/material.dart';
import 'package:icfesapp/common/networks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialNetworkPage extends StatelessWidget {
  const SocialNetworkPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          _socialTile(context),
          SizedBox(height: 20.0),
          Expanded(
            child: _documentInterest(),
          ),
          Expanded(
            child: _socialNetwork(context),
          )
        ],
      ),
    );
  }

  Widget _socialTile(context) {
    return Container(
        child: Text(
      'Más opciones',
      textAlign: TextAlign.right,
      style: Theme.of(context).textTheme.headline2,
    ));
  }

  Widget _documentInterest() {
    return ListView(
      children: <Widget>[
        DocumentInterest(
          title: 'Documentos de interés para el usuario',
          icon: Icons.picture_as_pdf_outlined,
          url: 'http://',
        ),
        DocumentInterest(
          title: 'Video pósters',
          icon: Icons.tv,
          url: 'http://',
        )
      ],
    );
  }
}

Widget _socialNetwork(context) {
  return Column(
    children: [
      Container(
        child: Row(
          children: <Widget>[
            Positioned(
              child: Container(
                height: 70.0,
                width: 50.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Column(
                        children: [
                          Container(
                            height: 70.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.pink),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.ac_unit,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 50.0,
                width: 70.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        height: 70.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.pink),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.access_alarm,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 50.0,
                width: 60.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        height: 70.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.access_alarm_sharp,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 50.0,
                width: 60.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        height: 70.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.access_alarms_sharp,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
