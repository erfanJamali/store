import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/static_data/static_values.dart';
import 'package:store/functions/textStyle.dart';

import '../main_pages/main.dart';

class sign_log_in_page extends StatefulWidget {
  const sign_log_in_page({super.key});

  @override
  State<sign_log_in_page> createState() => _sign_log_in_pageState();
}

bool logIn = false;

String pageName = (logIn) ? "Log in" : "Sign in";

class _sign_log_in_pageState extends State<sign_log_in_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageName,
          style: myTextStyle.ts(
              pageTitleText[0], pageTitleText[1], pageTitleText[2]),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                CupertinoDialogRoute(
                    builder: (context) => const main_page(), context: context));
            currentPageIndex = 0;
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.lock_rounded, size: 100),
            const SizedBox(height: 60),
            const Text("Welcome back you've been missed!",
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            if (logIn) ...{
              const TextField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                  border: OutlineInputBorder(),
                ),
              ),
            } else ...{
              const Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot Password", style: TextStyle(fontSize: 15)),
              ),
            },
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  logInPage();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    pageName,
                    style: const TextStyle(
                        color: CupertinoColors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logInPage() {
    setState(() {
      logIn = true;
    });
  }

  void signInPage() {
    setState(() {
      logIn = false;
    });
  }
}
