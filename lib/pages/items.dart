import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomepageTemp extends StatelessElement {
  HomepageTemp(StatelessWidget widget) : super(widget);

  final opciones = ['', ''];
  @override
  Widget build() {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: ListView(children: _crearItems()),
    );
  }

  List<Widget> _crearItems() {
    return opciones.map((item) {
      return ListTile(
        title: Text(item),
      );
    }).toList();
  }
}
