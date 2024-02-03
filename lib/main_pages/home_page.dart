import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/sub_pages/notifications_page.dart';
import 'package:store/sub_pages/search_page.dart';
import '../widgets/productCard.dart';
import '../static_data/Products.dart';
import '../sub_pages/ProductInfo_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:store/functions/textStyle.dart';

// home page
class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

late Size thisSize;

int suggestionIndex = 0;

int proInfoIndex = 0;

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    thisSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Hi, erfan",
                                      style: myTextStyle.ts(
                                              Colors.black, 12, false) ??
                                          const TextStyle()),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    Icons.waving_hand_rounded,
                                    color: CupertinoColors.activeOrange,
                                  )
                                ],
                              ),
                              Text(
                                "WELCOME BACK",
                                style: myTextStyle.ts(Colors.black, 25, true),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoDialogRoute(
                                      builder: (context) =>
                                          const notifications_page(),
                                      context: context));
                            },
                            child: const Icon(
                              Icons.notification_add_rounded,
                              size: 35,
                              color: CupertinoColors.activeOrange,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoDialogRoute(
                                  builder: (Context) => const search_page(),
                                  context: context));
                        },
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search_rounded),
                            hintText: "search",
                            hintStyle:
                                myTextStyle.ts(Colors.black54, 21, false),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text("suggestions",
                            style: myTextStyle.ts(Colors.black, 35, true))),
                    SizedBox(
                      height: thisSize.height * 0.5,
                      child: CarouselSlider(
                        items: makeSlideShow(context, 5),
                        options: CarouselOptions(
                            scrollDirection: Axis.horizontal,
                            height: 500,
                            autoPlay: true,
                            onPageChanged: (newIndex, idk) {
                              setState(() {
                                suggestionIndex = newIndex;
                              });
                            }),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(ProductsList[suggestionIndex].proName,
                              style: myTextStyle.ts(Colors.black, 30, true)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(ProductsList[suggestionIndex].proPrice,
                                  style:
                                      myTextStyle.ts(Colors.black87, 20, true)),
                              const SizedBox(width: 5),
                              const Text("USD",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text("news",
                            style: myTextStyle.ts(Colors.black, 35, true))),
                    Column(children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          productCard(context, 1, 0),
                          productCard(context, 2, 0),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          productCard(context, 3, 0),
                          productCard(context, 4, 0),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          productCard(context, 5, 0),
                          productCard(context, 6, 0),
                        ],
                      ),
                    ]),
                    const SizedBox(height: 500),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> makeSlideShow(context, int num) {
  //
  List<Widget> tempList = [];
  //
  for (int i = 0; i < num; i++) {
    tempList.add(
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.deepPurple,
            image: DecorationImage(
                image: NetworkImage(ProductsList[i].proPic), fit: BoxFit.cover),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(10, 10)),
            ]),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            proInfoIndex = i;
            Navigator.push(
              context,
              CupertinoDialogRoute(
                  builder: (context) => const ProductInfo_page(),
                  context: context),
            );
          },
        ),
      ),
    );
  }
  //
  return tempList;
}
