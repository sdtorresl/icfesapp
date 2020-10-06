import 'package:flutter/material.dart';
import 'package:icfesapp/common/networks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icfesapp/common/social_icon.dart';

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
          _socialTitle(context),
          SizedBox(height: 20.0),
          DocumentInterest(
            title: 'Documentos de interés para el usuario',
            icon: Icons.picture_as_pdf,
            url: 'http://',
          ),
          DocumentInterest(
            title: 'Video pósters',
            icon: Icons.tv,
            url: 'http://',
          ),
          _socialNetwork(context),
        ],
      ),
    );
  }

  Widget _socialTitle(context) {
    return Container(
      child: Text(
        'Más opciones',
        textAlign: TextAlign.right,
        style:
            Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
      ),
    );
  }

  Widget _socialNetwork(context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SocialIcon(
              icon: FaIcon(FontAwesomeIcons.facebook),
              url: 'http://',
            ),
            SocialIcon(
              icon: FaIcon(FontAwesomeIcons.linkedin),
              url: 'http://',
            ),
            SocialIcon(
              icon: FaIcon(FontAwesomeIcons.twitter),
              url: 'http://',
            ),
            SocialIcon(
              icon: FaIcon(FontAwesomeIcons.youtube),
              url: 'http://',
            ),
          ],
        ),
      ),
    );
  }
}
