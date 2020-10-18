import 'package:flutter/material.dart';
import 'package:icfesapp/common/document_download.dart';
import 'package:icfesapp/models/document_model.dart';

class DocumentList extends StatelessWidget {
  final List<DocumentModel> documents;

  DocumentList({@required this.documents});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: documents.length,
        itemBuilder: (context, index) {
          return DocumentDownload(
            title: documents[index].title,
            description: documents[index].description,
            type: documents[index].type,
            url: documents[index].url,
          );
        },
      ),
    );
  }
}
