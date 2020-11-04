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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(25),
        child: Column(
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
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 18),
            Text(
              this.description,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 27),
            Image.asset(this.picture),
          ],
        ),
      ),
    );
  }
}
