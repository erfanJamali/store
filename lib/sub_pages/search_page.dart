import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/main_pages/home_page.dart';
import 'package:store/static_datas/Products.dart';
import 'package:store/static_datas/static_values.dart';

class search_page extends StatefulWidget {
  const search_page({super.key});

  @override
  State<search_page> createState() => _search_pageState();
}

TextEditingController controller = TextEditingController();

Color baseOrange = Colors.deepOrange;

Random r = Random();

class _search_pageState extends State<search_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: ts(pageTitleText[0], pageTitleText[1], pageTitleText[2]),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: controller,
              cursorColor: CupertinoColors.activeOrange,
              style: ts(Colors.black54, 21, false),
              decoration: InputDecoration(
                  hintText: "search between items",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: baseOrange))),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: thisSize.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: baseOrange,
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SUGGESTIONS", style: ts(Colors.white, 20, false)),
                      Text("for you", style: ts(Colors.white, 35, true)),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text("see more",
                              style: TextStyle(color: baseOrange)),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(
                                  ProductsList[r.nextInt(2)]
                                      .proPic),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        // margin: const EdgeInsets.only(right: 20),
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(
                                  ProductsList[r.nextInt(2)]
                                      .proPic),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        // margin: const EdgeInsets.only(right: 40),
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                             borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(
                                  ProductsList[r.nextInt(2)]
                                      .proPic),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 60),
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(
                                  ProductsList[0]
                                      .proPic),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
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
