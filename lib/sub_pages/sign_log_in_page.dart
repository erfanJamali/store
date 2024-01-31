import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/static_datas/static_values.dart';
import 'package:store/sub_pages/search_page.dart';
import 'package:store/functions/textStyle.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../main_pages/main.dart';

class sign_log_in_page extends StatefulWidget {
  const sign_log_in_page({super.key});

  @override
  State<sign_log_in_page> createState() => _sign_log_in_pageState();
}

String titleText = "SignIn";

bool logIn = true;

class _sign_log_in_pageState extends State<sign_log_in_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleText,
          style: myTextStyle.ts(
              pageTitleText[0], pageTitleText[1], pageTitleText[2]),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                CupertinoDialogRoute(
                    builder: (context) => main_page(), context: context));
            currentPageIndex = 0;
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Center(
          child: (logIn) ? logInPage() : signInPage(),
        ),
      ),
    );
  }

  Widget logInPage() {
    titleText = "SignIn";
    return Column(
      children: [
        Text("Log In", style: myTextStyle.ts(Colors.black, 85, true)),
        Text("or", style: myTextStyle.ts(Colors.black54, 20, false)),
        AnimatedTextKit(
          onTap: () {
            setState(() {
              logIn = false;
            });
          },
          animatedTexts: [
            ColorizeAnimatedText(
              "Sign In",
              textStyle: myTextStyle.ts(CupertinoColors.link, 55, false),
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
        const SizedBox(height: 30),
        TextField(
          cursorColor: baseOrange,
          decoration: InputDecoration(
              labelText: "Google Mail",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: baseOrange))),
        ),
        const Spacer(),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child:
                Text("N E X T", style: myTextStyle.ts(Colors.white, 35, true)),
          ),
        ),
      ],
    );
  }

  Widget signInPage() {
    titleText = "logIn";
    return Column(
      children: [
        Text("Sign In", style: myTextStyle.ts(Colors.black, 85, true)),
        Text("or", style: myTextStyle.ts(Colors.black54, 20, false)),
        AnimatedTextKit(
          onTap: () {
            setState(() {
              logIn = true;
            });
          },
          animatedTexts: [
            ColorizeAnimatedText(
              "Log In",
              textStyle: myTextStyle.ts(CupertinoColors.link, 55, false),
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
              backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child:
                Text("N E X T", style: myTextStyle.ts(Colors.white, 35, true)),
          ),
        ),
      ],
    );
  }
}
