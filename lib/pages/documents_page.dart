import 'package:flutter/material.dart';

import 'package:icfesapp/common/document_download.dart';
import 'package:icfesapp/models/document_model.dart';
import 'package:icfesapp/models/event_model.dart';
import 'package:icfesapp/providers/event_provider.dart';

import '../main.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({Key key}) : super(key: key);

  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: IcfesApp().accent,
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          padding: EdgeInsets.only(left: 75),
          child: Image(
            width: 300,
            image: AssetImage('assets/img/dots.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
      ),
      body: Container(
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
          print(event);
          List<DocumentModel> documents = event.documents;

          return _sections(context, documents);
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

Widget _sections(context, List<DocumentModel> documets) {
  print(documets);
  return Container(
    child: ListView.builder(
      itemCount: documets.length,
      itemBuilder: (context, index) {
        DocumentModel document = documets[index];

        return DocumentDownload(
          url: document.url,
          title: document.title,
          description: document.description,
          type: document.type,
        );
      },
    ),
  );
}

Widget _mainTitle(context) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Text(
      "Documentos",
      style:
          Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
    ),
  );
}
