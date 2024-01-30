import 'package:flutter/material.dart';
import 'package:store/static_datas/notifications_List.dart';

void submitNotif(String notif, bool removeAble, int fun){
  notificationsList.add(NotificationConst(notif, removeAble, fun));
}