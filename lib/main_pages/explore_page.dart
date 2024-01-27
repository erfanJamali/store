// explore page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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