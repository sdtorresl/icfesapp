import 'package:flutter/material.dart';
import 'package:icfesapp/common/desing_poster.dart';
import 'package:icfesapp/models/video_poster_model.dart';

class PosterList extends StatelessWidget {
  final List<VideoPosterModel> posters;

  PosterList({@required this.posters});
  @override
  Widget build(BuildContext context) {
    const String _baseUrl = "https://dev-eweb.us.seedcloud.co";
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: posters.length,
        itemBuilder: (context, index) {
          String _videosUrl = _baseUrl + posters[index].videos;
          return DesingPoster(
            
            title: posters[index].,
            subtitle: posters[index].description,
            videos: (
              videoUrl: _videosUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }
}
