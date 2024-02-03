import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/widgets/productCard.dart';
import 'package:store/main_pages/home_page.dart';
import 'package:store/static_data/static_values.dart';
import 'package:store/static_data/Products.dart';
import 'package:store/functions/textStyle.dart';

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
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_rounded)),
        shadowColor: Colors.black87,
        elevation: 10,
        title: Text(
          "Search",
          style: myTextStyle.ts(
              pageTitleText[0], pageTitleText[1], pageTitleText[2]),
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
                style: myTextStyle.ts(Colors.black54, 21, false),
                decoration: InputDecoration(
                    hintText: "search between items",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: baseOrange))),
                onChanged: (newVal) {
                  setState(() {
                    searchItems(newVal);
                  });
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
                              style: myTextStyle.ts(Colors.white, 20, false)),
                          Text("for you",
                              style: myTextStyle.ts(Colors.white, 35, true)),
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
                          style: myTextStyle.ts(Colors.black, 45, true))),
                  Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: Text("Best price",
                          style: myTextStyle.ts(Colors.black87, 35, false))),
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
                              style: myTextStyle.ts(Colors.black87, 35, false)),
                          Text("(working days)",
                              style: myTextStyle.ts(Colors.black87, 20, false)),
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
                          style: myTextStyle.ts(Colors.black87, 35, false))),
                  Row(
                    children: [
                      productCard(context, 0, 3),
                      productCard(context, 1, 3),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              )
            } else ...{
              Column(
                children: makeResult(),
              )
            }
          ],
        ),
      ),
    );
  }

  List<Product> resultList = [];

  void searchItems(String query) {
    resultList = ProductsList.where((element) =>
        element.proName.toLowerCase().contains(query.toLowerCase())).toList();
  }

  List<Widget> makeResult() {
    //
    List<Widget> tempList = [];
    //
    for (int i = 0; i < resultList.length; i++) {
      tempList.add(searchProductCard(context, i, 0));
    }
    //
    return tempList;
    //
  }
}

// List<Widget> searchResults(context) {
//   //
//   String input = controller.text.toLowerCase();
//   //
//   List<Widget> foundList = [];
//   //
//   for (int i = 0; i < input.length; i++) {
//     for (int j = 0; j < ProductsList.length; j++) {
//       if (input[i].contains(ProductsList[j].proName[j].toLowerCase())) {
//         foundList.add(productCard(context, j, 0));
//         print("yea");
//       }
//     }
//   }
//   print(input);
//
//   //
//   return foundList;
// }
