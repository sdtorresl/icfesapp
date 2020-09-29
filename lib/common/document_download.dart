import 'package:flutter/material.dart';

final textStyle2 = new TextStyle(fontSize: 18, color: Colors.black);

class DocumentDownload extends StatelessWidget {
  final String title;
  final IconData icon;
  final String url;

  const DocumentDownload({Key key, this.title, this.icon, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        leading: Icon(this.icon, color: Colors.black26),
        onLongPress: () {},
        title: Text(this.title, style: textStyle2),
      ),
    );
  }
}
