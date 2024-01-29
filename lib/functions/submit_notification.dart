import 'package:flutter/material.dart';
import 'package:store/static_datas/notifications_List.dart';

void submitNotif(context,String notif, bool removeAble, bool snackBar){
  //
  notificationsList.add(NotificationConst(notif, removeAble));
  //
  if(snackBar){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Awesome Snackbar!'),
          action: SnackBarAction(
            label: 'Action',
            onPressed: () {
              // Code to execute.
            },
          ),
        )
    );
  }
}