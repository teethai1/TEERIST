import 'package:flutter/material.dart';

Widget okButton(BuildContext context) {
  return FlatButton(
    child: Text('OK'),
    onPressed: () {Navigator.of(context).pop();},
  );
}

Future<void> normalDialog(
    String title, String message, BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[okButton(context)],
      );
    },
  );
}
