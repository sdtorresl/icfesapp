import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icfesapp/common/countdown.dart';
import 'package:icfesapp/common/event_description.dart';
import 'package:icfesapp/common/expansion_card.dart';
import 'package:icfesapp/main.dart';
import 'package:icfesapp/models/event_model.dart';
import 'package:icfesapp/models/section_model.dart';
import 'package:icfesapp/providers/event_provider.dart';
import 'package:icfesapp/utils/column_builder.dart';

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

          Widget description = Container(
            height: 470,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: EventDescription(
                    title: event.title,
                    description: event.description,
                    picture: event.picture,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: IcfesApp().grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

          return ListView(
            children: [
              description,
              Container(
                decoration: BoxDecoration(
                  color: IcfesApp().grey,
                ),
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 40),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Empieza nuestro conteo para el evento",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Countdown(startDate: event.startDate),
                    _sections(context, sections),
                  ],
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
    return ColumnBuilder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        SectionModel section = sections[index];
        return ExpansionCard(
          title: section.title,
          subtitle: section.description,
          hidden: CachedNetworkImage(
            imageUrl: section.picture,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        );
      },
    );
  }
}
