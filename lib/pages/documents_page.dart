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
          description: "documento 1",
          icon: Icons.insert_drive_file_outlined,
          type: 'pdf',
          url: "http://",
        ),
        DocumentDownload(
          title: "Descarga el kit de documentos",
          description: 'documento2',
          icon: Icons.insert_drive_file_outlined,
          type: 'pdf',
          url: "http://",
        ),
        DocumentDownload(
          title: "Descarga el kit de documentos",
          description: 'documento3',
          icon: Icons.insert_drive_file_outlined,
          type: 'pdf',
          url: "http://",
        ),
        DocumentDownload(
          title: "Descarga el kit de documentos",
          description: "documentos4",
          icon: Icons.insert_drive_file_outlined,
          type: 'pdf',
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
