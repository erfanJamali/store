import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/static_datas/static_values.dart';
import 'package:store/static_datas/notifications_List.dart';
import 'package:store/functions/textStyle.dart';
import 'package:store/sub_pages/sign_log_in_page.dart';

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
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        shadowColor: Colors.black87,
        elevation: 10,
        title: Text(
          "Notifications",
          style: myTextStyle.ts(
              pageTitleText[0], pageTitleText[1], pageTitleText[2]),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: thereIsMessageOrNot(context),
      ),
    );
  }

  //
  Widget thereIsMessageOrNot(context) {
    if (notificationsList.isEmpty) {
      return Column(
        children: [
          const SizedBox(height: 50),
          Text(
            "There is nothing!",
            style: myTextStyle.ts(Colors.deepOrange, 35, true),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: makeNotifCard(context),
        ),
      );
    }
  }

  //
  List<Widget> makeNotifCard(context) {
    //
    List<Widget> tempList = [];
    //
    for (int i = 0; i < notificationsList.length; i++) {
      tempList.add(Column(
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54,
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: Offset(7, 10))
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(notificationsList[i].message),
                const Spacer(),
                InkWell(
                  onTap: () {
                    switch (notificationsList[i].fun) {
                      case 0:
                        //Navigator.pop(context);
                        Navigator.push(
                            context,
                            CupertinoDialogRoute(
                                builder: (context) => const sign_log_in_page(),
                                context: context));
                        break;
                      case 1:
                        break;
                    }
                  },
                  child: const Icon(Icons.open_in_new_rounded, size: 30),
                ),
                const SizedBox(width: 10),
                if (notificationsList[i].removable) ...{
                  InkWell(
                    onTap: () {
                      setState(() {
                        notificationsList.removeAt(i);
                      });
                    },
                    child: const Icon(Icons.highlight_remove_rounded, size: 30),
                  )
                }
              ],
            ),
          ),
        ],
      ));
    }
    //
    return tempList;
  }
}
