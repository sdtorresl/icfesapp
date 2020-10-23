import 'package:flutter/material.dart';
import 'package:icfesapp/main.dart';

Future<void> showMyDialog(
    BuildContext context, String title, Widget body) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(child: body),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Aceptar',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: SeminarioInternacional().accent,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
