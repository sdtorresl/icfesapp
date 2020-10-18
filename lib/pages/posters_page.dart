import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:icfesapp/common/poster_view.dart';

import 'package:icfesapp/providers/poster_provider.dart';

void main() => runApp(PostersPage());

class PostersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _topBar(context),
      bottomNavigationBar: BackButton(color: Colors.pink),
      backgroundColor: Color(0xFFFAFAFA),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(243, 243, 243, 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              _posterTitle(context),
              Expanded(child: _listPoster(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double barHeight = 100;
    return PreferredSize(
      preferredSize: Size(
        screenWidth,
        barHeight,
      ),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/colors2.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _posterTitle(context) {
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
