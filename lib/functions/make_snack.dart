import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/sub_pages/sign_log_in_page.dart';

void makeSnackBar(context, String snackText, String actionName) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(snackText),
    action: SnackBarAction(
        label: actionName,
        onPressed: () {
          if (actionName.isNotEmpty) {
            switch(actionName.toLowerCase()){
              case "signup":
                Navigator.push(context, CupertinoDialogRoute(builder: (context) => const sign_log_in_page(), context: context));
                break;
            }
          }
        }),
  ));
}
