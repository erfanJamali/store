import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/functions/productCard.dart';
import 'package:store/main_pages/home_page.dart';
import 'package:store/static_datas/static_values.dart';
import 'package:store/static_datas/Products.dart';


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
      body: SingleChildScrollView(
        child: Column(
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
                onChanged: (a) {
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 20),
            if (controller.text == "") ...{
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
                          Text("SUGGESTIONS",
                              style: ts(Colors.white, 20, false)),
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
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(
                                  ProductsList[r.nextInt(2)].proPic),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text("TOP SALES BY",
                          style: ts(Colors.black, 45, true))),
                  Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: Text("Best price",
                          style: ts(Colors.black87, 35, false))),
                  Row(
                    children: [
                      productCard(context, 3, 1),
                      productCard(context, 4, 1),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Text("Fast post",
                              style: ts(Colors.black87, 35, false)),
                          Text("(working days)",
                              style: ts(Colors.black87, 20, false)),
                        ],
                      )),
                  Row(
                    children: [
                      productCard(context, 5, 2),
                      productCard(context, 6, 2),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: Text("most bought",
                          style: ts(Colors.black87, 35, false))),
                  Row(
                    children: [
                      productCard(context, 0, 3),
                      productCard(context, 1, 3),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              )
            } else
              ...{
              Column(
                children: searchResults(context),
              )
              }
          ],
        ),
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


List<Widget> searchResults(context) {
  //
  String input = controller.text.toLowerCase();
  //
  List<Widget> foundList = [];
  //
  for(int i  = 0; i < input.length; i++){

    for(int j = 0; j < ProductsList.length; j++){

      if(input[i].contains(ProductsList[j].proName[j].toLowerCase())){

        foundList.add(productCard(context, j, 0));
        print("yea");

      }

    }

  }
print(input);

  //
  return foundList;
}
