import 'package:flutter/material.dart';
import 'package:icfesapp/common/custom_webview.dart';
import 'package:icfesapp/common/room_list.dart';
import 'package:icfesapp/main.dart';
import 'package:icfesapp/models/room_model.dart';
import 'package:icfesapp/providers/rooms_provider.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({Key key}) : super(key: key);
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final roomsProvider = RoomsProvider();
    return FutureBuilder(
      future: roomsProvider.getRooms(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return bottomSelector(context);
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

  Widget bottomSelector(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(color: IcfesApp().primaryLight),
            padding: EdgeInsets.all(10),
            child: Text(
              "Charlas en vivo",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white),
            ),
          ),
          onTap: () {
            setState(() {});
          },
        ),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(color: IcfesApp().primaryLight),
            padding: EdgeInsets.all(10),
            child: Text(
              "Material Pregravado",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white),
            ),
          ),
          onTap: () {},
        )
      ],
    );
  }
}
