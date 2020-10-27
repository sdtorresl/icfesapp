import 'package:flutter/material.dart';
import 'package:icfesapp/models/prerecorded_model.dart';
import 'package:vimeoplayer/vimeoplayer.dart';

import '../main.dart';

class RecordedPage extends StatefulWidget {
  final PrerecordedModel record;

  RecordedPage({Key key, @required this.record}) : super(key: key);

  @override
  _RecordedPageState createState() => _RecordedPageState();
}

class _RecordedPageState extends State<RecordedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: IcfesApp().accent,
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          padding: EdgeInsets.only(left: 75),
          child: Image(
            width: 300,
            image: AssetImage('assets/img/dots.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20, top: 20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.record.title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: VimeoPlayer(
              id: widget.record.videoCode,
              autoPlay: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.record.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
          )
        ],
      ),
    );
  }
}
