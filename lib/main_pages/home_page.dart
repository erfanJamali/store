import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/sub_pages/notifications_page.dart';
import '../main.dart';
import '../static_datas/Products.dart';
import '../sub_pages/ProductInfo_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                          InkWell(
                            onTap: (){
                              Navigator.push(context, CupertinoDialogRoute(builder: (context) => const notifications_page(), context: context));
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
                          Text(ProductsList[suggestionIndex].proName,
                              style: ts(Colors.black, 30, true)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(ProductsList[suggestionIndex].proPrice,
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
                builder: (context) => ProductInfo_page(), context: context));
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
                image: NetworkImage(ProductsList[whichProduct].proPic),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const Spacer(),
          Text(ProductsList[whichProduct].proName,
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
                image: NetworkImage(ProductsList[i].proPic),
                fit: BoxFit.cover)),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            proInfoIndex = i;
            Navigator.push(
              context,
              CupertinoDialogRoute(
                  builder: (context) => ProductInfo_page(), context: context),
            );
          },
        ),
      ),
    );
  }
  //
  return tempList;
}

TextStyle ts(Color myColor, double myFontSize, bool boldFont) {
  return TextStyle(
      color: myColor,
      fontSize: myFontSize,
      fontWeight: (boldFont) ? FontWeight.bold : FontWeight.normal);
}
