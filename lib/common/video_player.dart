import 'package:vimeoplayer/vimeoplayer.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFF15162B), //FF15162B // 0xFFF2F2F2
        appBar: MediaQuery.of(context).orientation == Orientation.portrait
            ? AppBar(
                leading: BackButton(color: Colors.white),
                title: Text('video'),
                backgroundColor: Color(0xAA15162B),
              )
            : PreferredSize(
                child: Container(
                  color: Colors.transparent,
                ),
                preferredSize: Size(1.0, 1.0),
              ),
        body: ListView(children: <Widget>[
          VimeoPlayer(id: '78678'),
        ]));
  }
}
