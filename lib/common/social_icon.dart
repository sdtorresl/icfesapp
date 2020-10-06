import 'package:flutter/material.dart';

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
        onPressed: () {
          print(this.url);
        },
      ),
    );
  }
}
