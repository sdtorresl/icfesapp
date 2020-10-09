import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:icfesapp/common/poster_view.dart';

import 'package:icfesapp/providers/poster_provider.dart';

class PosterPage extends StatelessWidget {
  const PosterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 130.0),
              _posterTile(context),
              Expanded(child: _listPoster(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _posterTile(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Text(
        'Video Posters',
        textAlign: TextAlign.left,
        style:
            Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
      ),
    );
  }

  Widget _listPoster(context) {
    final posterProvider = PosterProvider();
    return FutureBuilder(
      future: posterProvider.getPosters(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return PosterList(posters: snapshot.data);
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
