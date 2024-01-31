import 'package:flutter/material.dart';

void makeSnackBar(context, String snackText, String actionName) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(snackText),
    action: SnackBarAction(
        label: actionName,
        onPressed: () {
          if (actionName.isNotEmpty) {}
        }),
  ));
}
