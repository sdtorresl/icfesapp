import 'package:flutter/material.dart';
import 'package:icfesapp/common/video_poster.dart';

import 'package:icfesapp/models/video_poster_model.dart';

class PosterList extends StatelessWidget {
  final List<VideoPosterModel> posters;

  PosterList({@required this.posters});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: posters.length,
        itemBuilder: (context, index) {
          print(posters[index].toString());
          return PosterView(
            video: posters[index].videos.url,
            title: posters[index].titulo,
            subtitle: posters[index].descripcion,
            attachment: posters[index].imagen,
          );
        },
      ),
    );
  }
}
