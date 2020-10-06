import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icfesapp/common/event_description.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/main.dart';
import 'package:icfesapp/models/event_model.dart';
import 'package:icfesapp/models/section_model.dart';
import 'package:icfesapp/providers/event_provider.dart';
import 'package:icfesapp/utils/column_builder.dart';

final textstyle3 = new TextStyle(fontSize: 18, color: Colors.black);

class LobbyPage extends StatefulWidget {
  const LobbyPage({Key key}) : super(key: key);

  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EventProvider eventProvider = EventProvider();

    return FutureBuilder(
      future: eventProvider.getEvent(),
      builder: (BuildContext context, AsyncSnapshot<EventModel> snapshot) {
        if (snapshot.hasData) {
          EventModel event = snapshot.data;
          List<SectionModel> sections = event.sections;

          Widget description = Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: EventDescription(
              title: event.title,
              description: event.description,
              picture: event.picture.toString(),
            ),
          );

          return Stack(
            children: [
              description,
              Positioned(
                top: 350,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: IcfesApp().grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Empieza nuestro conteo para el evento",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      //_watch(context),
                      _sections(context, sections),
                    ],
                  ),
                ),
              ),
            ],
          );
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

  Widget _sections(context, List<SectionModel> sections) {
    print("Sections: $sections");
    print("Sections: ${sections.length}");

    return ColumnBuilder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        SectionModel section = sections[index];
        return ExpansionCard(
          title: section.title,
          subtitle: section.description,
          starDate: "wharever",
          picture: CachedNetworkImage(
            imageUrl: section.picture,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        );
      },
    );
  }
}

Widget _watch(context) {
  return Column(
    children: [
      Container(
        child: Row(
          children: <Widget>[
            Positioned(
              child: Container(
                height: 100.0,
                width: 120.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Column(
                        children: [
                          Container(
                            height: 70.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 5, color: Colors.blue),
                                shape: BoxShape.circle,
                                color: Colors.lightBlue[900]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '03',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 100.0,
                width: 120.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        height: 70.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            border: Border.all(width: 5, color: Colors.blue),
                            shape: BoxShape.circle,
                            color: Colors.lightBlue[900]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '72',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 100.0,
                width: 120.0,
                child: Stack(children: <Widget>[
                  Positioned(
                    child: Container(
                      height: 70.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5, color: Colors.blue),
                        shape: BoxShape.circle,
                        color: Colors.lightBlue[900],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '00',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
