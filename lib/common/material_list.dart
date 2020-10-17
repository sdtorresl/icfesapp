import 'package:flutter/material.dart';

import 'package:icfesapp/common/material_card.dart';
import 'package:icfesapp/models/prerecorded_model.dart';

class MaterialList extends StatelessWidget {
  final List<PrerecordedModel> materials;

  MaterialList({@required this.materials});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: materials.length,
        itemBuilder: (context, index) {
          return MaterialCard(
            title: materials[index].title,
            description: materials[index].description,
            uploadDate: materials[index].uploadDate,
            videoCode: materials[index].videoCode,
          );
        },
      ),
    );
  }
}
