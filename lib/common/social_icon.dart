import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatelessWidget {
  final Widget icon;
  final String url;

  const SocialIcon({Key key, @required this.icon, @required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
      child: IconButton(
        icon: this.icon,
        color: Colors.white,
        onPressed: () => _openSocialUrl(),
      ),
    );
  }

  _openSocialUrl() async {
    if (await canLaunch(this.url)) {
      await launch(this.url);
    } else {
      throw 'Could not launch ${this.url}';
    }
  }
}
