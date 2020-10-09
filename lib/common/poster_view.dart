import 'package:flutter/material.dart';
import 'package:icfesapp/common/poster_desing.dart';

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
          return DesingPoster(
            video: posters[index].videos,
            title: posters[index].titulo,
            subtitle: posters[index].descripcion,
          );
        },
      ),
    );
  }
}
