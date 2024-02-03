// explore page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/main_pages/home_page.dart';
import 'package:store/sub_pages/ProductInfo_page.dart';
import 'package:store/static_data/products.dart';

class explore_page extends StatefulWidget {
  const explore_page({super.key});

  @override
  State<explore_page> createState() => _explore_pageState();
}

class _explore_pageState extends State<explore_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: explorePosts(),
        ),
      ),
    );
  }

  List<Widget> explorePosts() {
    //
    List<Widget> tempList = [];
    //
    for (int j = 0; j < 10; j++) {
      for (int i = 0; i < ProductsList.length; i++) {
        tempList.add(
          InkWell(
            onTap: () {
              proInfoIndex = i;
              Navigator.push(
                  context,
                  CupertinoDialogRoute(
                      builder: (context) => const ProductInfo_page(),
                      context: context));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(ProductsList[i].proPic),
                      fit: BoxFit.cover)),
            ),
          ),
        );
      }
    }
    //
    return tempList;
  }

  List<Widget> categoryCard() {
    //
    List<Widget> tempList = [];
    //
    for (int i = 0; i < categoryEntity.length; i++) {
      tempList.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(categoryEntity[i]),
        ),
      );
    }
    //
    return tempList;
  }
}