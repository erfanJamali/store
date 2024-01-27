import 'package:flutter/material.dart';
import 'package:store/static_datas/Products.dart';
import 'package:store/static_datas/notifications_List.dart';

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
          title: const Text("Notifications"),
        ),
        body: Center(child: thereIsMessageOrNot()));
  }
}

Widget thereIsMessageOrNot() {
  if (notificationsList.isEmpty) {
    return Column(
      children: [
        SizedBox(height: 50),
        Text(
          "There is nothing!",
          style: ts(Colors.deepOrange, 35, true),
        ),
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://media1.tenor.com/m/DXu_d-6Pz4AAAAAC/napoleon-there-is-nothing-we-can-do.gif"),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54, blurRadius: 10, spreadRadius: 1),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  } else {
    return SingleChildScrollView();
  }
}

TextStyle ts(Color myColor, double myFontSize, bool boldFont) {
  return TextStyle(
      color: myColor,
      fontSize: myFontSize,
      fontWeight: (boldFont) ? FontWeight.bold : FontWeight.normal);
}
