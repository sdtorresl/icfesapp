import 'package:flutter/material.dart';
import 'package:icfesapp/common/document_download.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({Key key}) : super(key: key);

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
    return ListView(
      children: <Widget>[
        DocumentDownload(
          title: "Descarga el kit de documentos",
          icon: Icons.dashboard,
          url: "http://",
        ),
        DocumentDownload(
          title: "Descarga el kit de documentos",
          icon: Icons.insert_drive_file,
          url: "http://",
        ),
        DocumentDownload(
          title: "Descarga el kit de documentos",
          icon: Icons.dashboard,
          url: "http://",
        ),
        DocumentDownload(
          title: "Descarga el kit de documentos",
          icon: Icons.dashboard,
          url: "http://",
        ),
      ],
    );
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
}
