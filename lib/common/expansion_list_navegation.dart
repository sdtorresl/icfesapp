import 'package:flutter/material.dart';

class ExpansionList extends StatefulWidget {
  @override
  _ExpansionListState createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  String _list = '';

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Nombre de la sala',
        suffixIcon: Icon(Icons.expand_more),
      ),
      onChanged: (valor) {
        setState(() {
          _list = valor;
        });
      },
    );
  }
}
