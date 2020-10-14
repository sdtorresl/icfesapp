import 'package:flutter/material.dart';
import 'package:icfesapp/common/document_download.dart';

import 'package:icfesapp/models/document_model.dart';
import 'package:icfesapp/models/event_model.dart';
import 'package:icfesapp/providers/event_provider.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key key}) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _mainTitle(context),
          SizedBox(height: 20),
          Expanded(
            child: _listDocuments(),
          ),
        ],
      ),
    );
  }

  Widget _listDocuments() {
    EventProvider eventProvider = EventProvider();
    return FutureBuilder(
      future: eventProvider.getEvent(),
      builder: (BuildContext context, AsyncSnapshot<EventModel> snapshot) {
        if (snapshot.hasData) {
          EventModel event = snapshot.data;
          List<DocumentModel> documents = event.documents;

          print("Event: ${event.startDate}");

          Widget description = Container(
            height: 400,
            child: DocumentDownload(
              url: '',
              title: event.title,
              description: event.description,
              type: '',
            ),
          );

          return ListView(
            children: [
              description,
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
}

Widget _mainTitle(context) {
  return Container(
    child: Text(
      "Documentos",
      style:
          Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
    ),
  );
}
