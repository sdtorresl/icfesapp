import 'package:flutter/material.dart';

final textStyle2 = new TextStyle(fontSize: 18, color: Colors.black);

class OptionsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String url;
  final Function onTap;

  const OptionsCard({Key key, this.title, this.icon, this.url, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue[800],
      elevation: 2.0,
      margin: EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        leading: Icon(this.icon, color: Colors.white),
        onTap: this.onTap,
        title: Text(this.title, style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}
