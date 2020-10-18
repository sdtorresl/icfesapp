import 'package:flutter/material.dart';
import 'package:icfesapp/common/expansion_card.dart';

import 'package:icfesapp/common/material_card.dart';
import 'package:icfesapp/models/prerecorded_model.dart';
import 'package:icfesapp/utils/date_formatter.dart';

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
          return ExpansionCard(
            starDate:
                DateFormatter.dateTimeToString(materials[index].uploadDate),
            title: materials[index].title,
            subtitle: '',
            picture: Column(
              children: [
                Text(
                  materials[index].description,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  materials[index].videoCode,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Colors.black,
                      ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
