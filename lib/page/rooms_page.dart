import 'package:flutter/material.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/providers/rooms_provider.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 1,
                        height: 50,
                        color: Colors.black,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 6.0, color: Colors.blue[50]),
                          color: Colors.teal[50],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.circle,
                          color: Colors.blue,
                        ),
                      ),
                      Container(width: 3, height: 30, color: Colors.black)
                    ],
                  ),
                  Expanded(
                    child: Container(
                        height: 120,
                        child: Column(
                          children: [
                            ExpansionCard(
                              title: "Ejemplo",
                              subtitle: "Ejemplo subtítulo",
                              picture: Image.asset('assets/img/sem2020.png'),
                              onChanged: () {
                                RoomsProvider roomsProvider = RoomsProvider();
                                roomsProvider.getRooms();
                              },
                            ),
                          ],
                        )),
                  )
                ],
              ),
            );
          }),
    );
    /*ExpansionCard(
      title: "Ejemplo",
      subtitle: "Ejemplo subtítulo",
      picture: Image.asset('assets/img/sem2020.png'),
      onChanged: () {
        RoomsProvider roomsProvider = RoomsProvider();
        roomsProvider.getRooms();
      },
    );*/
  }
}
