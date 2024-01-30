import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/main_pages/profile_page.dart';
import 'package:store/static_datas/notifications_List.dart';

List<Widget> notifCard(context) {
  //
  List<Widget> tempList = [];
  //
  for (int i = 0; i < notificationsList.length; i++) {
    tempList.add(Column(
      children: [
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: Offset(10, 10))
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
                      Navigator.push(context, CupertinoDialogRoute(builder: (context) => const profile_page(), context: context));
                      break;
                    case 1:

                      break;
                  }
                },
                child: const Icon(Icons.open_in_new_rounded, size: 30),
              ),
              const SizedBox(width: 10),
              if (notificationsList[i].removable) ...{
                const Icon(Icons.highlight_remove_rounded, size: 30)
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
