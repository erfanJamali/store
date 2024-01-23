import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:google_nav_bar/google_nav_bar.dart";
import 'package:carousel_slider/carousel_slider.dart';

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
          (_currentIndex == 0)
              ? home_page()
              : (_currentIndex == 1)
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
                    _currentIndex = index;
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

int _currentIndex = 0;

// home page
class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

late Size thisSize;

int suggestionIndex = 0;

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
              //width: thisSize.width - 40,
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
                              borderRadius: BorderRadius.circular(20)),
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
                        items: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.deepPurple,
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/phone.webp"),
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/mazda.webp"),
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                    image: AssetImage("assets/images/shoe.png"),
                                    fit: BoxFit.fill)),
                          )
                        ],
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
                          Text(
                              (suggestionIndex == 0)
                                  ? "SM S21+"
                                  : (suggestionIndex == 1)
                                      ? "Mazda RX-7"
                                      : "NIK Air Force",
                              style: ts(Colors.black, 30, true)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  (suggestionIndex == 0)
                                      ? "999"
                                      : (suggestionIndex == 1)
                                          ? "250 000"
                                          : "500",
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
                    Column(
                      children: [
                        Row(
                          children: [
                            makeNews(thisSize, "assets/images/benz.webp", " MB S400"),
                            makeNews(thisSize, "assets/images/europ.jpg", "Europe"),
                          ],
                        ),
                        Row(
                          children: [
                            makeNews(thisSize, "assets/images/harmenkardon.jpg", "Harmen Kardon"),
                            makeNews(thisSize, "assets/images/rtx.jpg", "RTX 3090 on"),
                          ],
                        ),  Row(
                          children: [
                            makeNews(thisSize, "assets/images/mazda.webp", "Mazda RX-7"),
                            makeNews(thisSize, "assets/images/phone.webp", "Galaxy S21+"),
                          ],
                        ),

                      ]
                    ),
                    SizedBox(height: 500),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

// explore page
class explore_page extends StatefulWidget {
  const explore_page({super.key});

  @override
  State<explore_page> createState() => _explore_pageState();
}

class _explore_pageState extends State<explore_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text("data")),
    );
  }
}

// profile page
class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Profile",
              style: ts(Colors.black87, 25, true),
            ),
            Icon(Icons.person)
          ],
        ),
        shadowColor: Colors.black,
        elevation: 10,
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

Widget makeNews(Size thisSize, String assetPlace, String bottomText) {
  return Container(
    height: thisSize.height * 0.3,
    width: thisSize.width * 0.4,
    margin: EdgeInsets.only(
        left: (thisSize.width * 0.1) / 2,
        right: (thisSize.width * 0.1) / 2,
        top: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.blueGrey),
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
            child: Image(image: AssetImage(assetPlace),fit: BoxFit.fitHeight,),
          ),
        ),
        const Spacer(),
        Text(bottomText, style: ts(Colors.white, 20, true)),
        const Spacer(),
      ],
    ),
  );
}
