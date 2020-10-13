import 'package:flutter/material.dart';

class DocumentDownload extends StatelessWidget {
  final String title;
  final String description;
  final String type;
  final IconData icon;
  final String url;

  const DocumentDownload(
      {Key key, this.title, this.description, this.type, this.icon, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        leading: Icon(
          this.icon,
          color: Colors.black54,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.title,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Colors.black),
            ),
            Text(
              this.description,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.black),
            ),
            Text(
              this.type,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
        subtitle: Text(
          this.url,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.black),
        ),
        onLongPress: () {},
      ),
    );
  }
}
