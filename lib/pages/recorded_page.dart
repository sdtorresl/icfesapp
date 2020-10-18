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
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              widget.record.title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Colors.black),
            ),
          ),
          Container(
            child: VimeoPlayer(id: widget.record.videoCode, autoPlay: true),
          ),
        ],
      ),
    );
  }
}
