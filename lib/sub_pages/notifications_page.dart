import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:store/static_datas/static_values.dart';
import 'package:store/static_datas/notifications_List.dart';
import 'package:store/widgets/notif_card.dart';

class notifications_page extends StatefulWidget {
  const notifications_page({super.key});

  @override
  State<notifications_page> createState() => _notifications_pageState();
}

class _notifications_pageState extends State<notifications_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Notifications",
            style: ts(pageTitleText[0], pageTitleText[1], pageTitleText[2]),
          ),
        ),
        body: Center(child: thereIsMessageOrNot(context)));
  }
}

Widget thereIsMessageOrNot(context) {
  if (notificationsList.isEmpty) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Text(
          "There is nothing!",
          style: ts(Colors.deepOrange, 35, true),
        ),
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const Image(
            image: NetworkImage(
                "https://media1.tenor.com/m/DXu_d-6Pz4AAAAAC/napoleon-there-is-nothing-we-can-do.gif"),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  } else {
    return SingleChildScrollView(
      child: Column(
        children: notifCard(context),
      ),
    );
  }
}

TextStyle ts(Color myColor, double myFontSize, bool boldFont) {
  return TextStyle(
      color: myColor,
      fontSize: myFontSize,
      fontWeight: (boldFont) ? FontWeight.bold : FontWeight.normal);
}
