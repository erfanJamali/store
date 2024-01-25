// profile page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              // import ts to a global class
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
