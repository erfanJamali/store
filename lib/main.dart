import 'dart:html';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:google_nav_bar/google_nav_bar.dart";
import 'package:store/static_datas/Products.dart';
import 'package:store/main_pages/explore_page.dart';
import 'package:store/main_pages/profile_page.dart';

import 'main_pages/home_page.dart';

void main() {
  runApp(
    const MaterialApp(
      home: home_page(),
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
    //
    int currentPageIndex = 0;
    //
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          (currentPageIndex == 0)
              ? const home_page()
              : (currentPageIndex == 1)
                  ? const explore_page()
                  : const profile_page(),
          const Spacer(),
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
                    currentPageIndex = index;
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

TextStyle ts(Color myColor, double myFontSize, bool boldFont) {
  return TextStyle(
      color: myColor,
      fontSize: myFontSize,
      fontWeight: (boldFont) ? FontWeight.bold : FontWeight.normal);
}