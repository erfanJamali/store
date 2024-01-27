import 'dart:html';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:google_nav_bar/google_nav_bar.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:store/static_datas/products.dart';
import 'package:store/pages/explore_page.dart';
import 'package:store/pages/profile_page.dart';

import 'functions.dart';

void main() {
  runApp(
    const MaterialApp(
      home: main_page(),
    ),
  );
}

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          (_currentPageIndex == 0)
              ? home_page()
              : (_currentPageIndex == 1)
                  ? explore_page()
                  : profile_page(),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 14,
                    spreadRadius: 3,
                    offset: Offset(10, 10)),
              ],
            ),
            margin: const EdgeInsets.only(right: 30, left: 30, bottom: 50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: GNav(
                gap: 3,
                backgroundColor: Colors.white,
                style: GnavStyle.google,
                tabs: const [
                  GButton(icon: Icons.home_mini_outlined, text: "home"),
                  GButton(
                    icon: Icons.explore,
                    text: "Explore",
                  ),
                  GButton(icon: Icons.person, text: "profile"),
                ],
                onTabChange: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                selectedIndex: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}

int _currentPageIndex = 0;

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
                                      style: ts(Colors.black87, 23, false)),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    Icons.waving_hand_rounded,
                                    color: CupertinoColors.activeOrange,
                                  )
                                ],
                              ),
                              Text(
                                "WELCOME BACK",
                                style: ts(Colors.black, 25, true),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.notification_add_rounded,
                            size: 35,
                            color: CupertinoColors.activeOrange,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        style: ts(Colors.black, 20, false),
                        cursorColor: CupertinoColors.activeOrange,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search_rounded),
                          hintText: "search",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text("suggestions",
                            style: ts(Colors.black, 35, true))),
                    const SizedBox(height: 10),
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
                          Text(productsList[suggestionIndex].proName,
                              style: ts(Colors.black, 30, true)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(productsList[suggestionIndex].proPrice,
                                  style: ts(Colors.black87, 20, true)),
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
                        child: Text("news", style: ts(Colors.black, 35, true))),
                    Column(children: [
                      Row(
                        children: [
                          makeNews(context, 1),
                          makeNews(context, 2),
                        ],
                      ),
                      Row(
                        children: [
                          makeNews(context, 3),
                          makeNews(context, 4),
                        ],
                      ),
                      Row(
                        children: [
                          makeNews(context, 5),
                          makeNews(context, 6),
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

Widget makeNews(context, int whichProduct) {
  return Container(
    height: thisSize.height * 0.3,
    width: thisSize.width * 0.4,
    margin: EdgeInsets.only(
        left: (thisSize.width * 0.1) / 2,
        right: (thisSize.width * 0.1) / 2,
        top: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.blueGrey),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        proInfoIndex = whichProduct;
        Navigator.push(
            context,
            CupertinoDialogRoute(
                builder: (context) => productInfo_page(), context: context));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            height: (thisSize.height * 0.3) - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(productsList[whichProduct].proPic),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const Spacer(),
          Text(productsList[whichProduct].proName,
              style: ts(Colors.white, 20, true)),
          const Spacer(),
        ],
      ),
    ),
  );
}

List<Widget> makeSlideShow(context, int num) {
  //
  List<Widget> tempList = [];
  //
  for (int i = 0; i < num; i++) {
    tempList.add(
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.deepPurple,
            image: DecorationImage(
                image: NetworkImage(productsList[i].proPic),
                fit: BoxFit.cover)),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            proInfoIndex = i;
            Navigator.push(
              context,
              CupertinoDialogRoute(
                  builder: (context) => const productInfo_page(),
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

class productInfo_page extends StatelessWidget {
  const productInfo_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productsList[proInfoIndex].proName)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: thisSize.width,
              height: thisSize.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productsList[proInfoIndex].proPic),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 0,
                          color: Color(0xB3000000)),
                    ]),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: thisSize.width / 2,
                      height: thisSize.width * 0.7,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white60,
                              blurRadius: 30,
                              spreadRadius: 1,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                  productsList[proInfoIndex].proPic),
                              fit: BoxFit.cover)),
                    ),
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                child: Text(
                  productsList[proInfoIndex].proInfo,
                  style: ts(Colors.black87, 25, false),
                )),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.deepOrange),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("add to bag", style: ts(Colors.white, 20, false)),
                  ),
                ),
                const SizedBox(width: 20),
                Text(productsList[proInfoIndex].proPrice, style: ts(Colors.black87, 20,false)),
                const SizedBox(width: 5),
                const Text("USD")
              ],
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
