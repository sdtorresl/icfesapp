import 'package:flutter/material.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/providers/rooms_provider.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionCard(
      title: "Ejemplo",
      subtitle: "Ejemplo subtítulo",
      picture: Image.asset('assets/img/sem2020.png'),
      onChanged: () {
        RoomsProvider roomsProvider = RoomsProvider();
        roomsProvider.getRooms();
      },
    );
  }
}
