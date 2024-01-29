// profile page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/static_datas/accounts_list.dart';
import 'package:store/sub_pages/search_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Center(
            child: Column(
              children: [
                if (!isSigned) ...{
                  Text("Sign In", style: ts(Colors.black, 85, true)),
                  Text("or", style: ts(Colors.black54, 20, false)),
                  AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        "Log In",
                        textStyle: ts(CupertinoColors.link, 55, false),
                        speed: const Duration(milliseconds: 500),
                        colors: [
                          CupertinoColors.link,
                          Colors.black12,
                          CupertinoColors.link
                        ],
                      )
                    ],
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1),
                  ),
                  const SizedBox(height: 80),
                  TextField(
                    cursorColor: baseOrange,
                    decoration: InputDecoration(
                        labelText: "User Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: baseOrange))),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    cursorColor: baseOrange,
                    decoration: InputDecoration(
                        labelText: "Pass Word",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: baseOrange))),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5, left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: CupertinoColors.link),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text("N E X T", style: ts(Colors.white, 35, true)),
                    ),
                  ),
                } else
                  ...{}
              ],
            ),
          ),
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
