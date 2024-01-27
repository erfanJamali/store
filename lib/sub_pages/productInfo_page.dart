import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../main_pages/home_page.dart';
import '../static_datas/Products.dart';
import '../static_datas/static_values.dart';

class ProductInfo_page extends StatelessWidget {
  const ProductInfo_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ProductsList[proInfoIndex].proName, style: ts(pageTitleText[0], pageTitleText[1], pageTitleText[2]))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: thisSize.width,
              height: thisSize.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(ProductsList[proInfoIndex].proPic),
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
                                  ProductsList[proInfoIndex].proPic),
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
                  ProductsList[proInfoIndex].proInfo,
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
                Text(ProductsList[proInfoIndex].proPrice, style: ts(Colors.black87, 20,false)),
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

TextStyle ts(Color myColor, double myFontSize, bool boldFont) {
  return TextStyle(
      color: myColor,
      fontSize: myFontSize,
      fontWeight: (boldFont) ? FontWeight.bold : FontWeight.normal);
}