import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

void showErrorDialog(String title, String message) {
  showDialog(
    context: globalContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimaryButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: "Ok"),
          )
        ],
      );
    },
  );
}
