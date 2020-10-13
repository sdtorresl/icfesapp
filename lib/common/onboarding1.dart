import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String picture;

  const Onboarding({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.description,
    @required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.only(left: 350),
              child: Icon(
                this.icon,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 125),
            Center(
              child: Text(
                this.title,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: Colors.black),
              ),
            ),
            Text(
              this.description,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.black),
            ),
            Image.asset(this.picture),
            SizedBox(height: 60),
            Container(
              width: 400,
              margin: EdgeInsets.only(bottom: 10),
              child: FloatingActionButton(
                elevation: 5.0,
                child: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 15,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.pink, width: 2),
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.pink, width: 2),
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.pink, width: 2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
