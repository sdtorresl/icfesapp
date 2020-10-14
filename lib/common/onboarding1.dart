import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  final String title;
  final String description;
  final String picture;

  const Onboarding({
    Key key,
    @required this.title,
    @required this.description,
    @required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 125),
            Text(
              this.title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Colors.black),
            ),
            Text(
              this.description,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.black),
            ),
            Image.asset(this.picture),
          ],
        ),
      ),
    );
  }
}
