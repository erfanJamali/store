import 'package:flutter/material.dart';
import 'package:store/functions/make_snack.dart';
import 'package:store/functions/submit_notification.dart';
import 'package:store/static_datas/accounts_list.dart';
import 'package:store/sub_pages/notifications_page.dart';

import '../main_pages/home_page.dart';
import '../static_datas/Products.dart';
import '../static_datas/static_values.dart';
import '../static_datas/notifications_List.dart';

class ProductInfo_page extends StatelessWidget {
  const ProductInfo_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new_rounded)),
          shadowColor: Colors.black87,
          elevation: 10,
          title: Text(ProductsList[proInfoIndex].proName,
              style: ts(pageTitleText[0], pageTitleText[1], pageTitleText[2]))),
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
                  onPressed: () {
                    if (!isSigned) {
                      String message = "you have to SignUp First";
                      submitNotif(message, false, 1);
                      makeSnackBar(context, message, "SignUp");
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Colors.deepOrange),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text("add to bag", style: ts(Colors.white, 20, false)),
                  ),
                ),
                const SizedBox(width: 20),
                Text(ProductsList[proInfoIndex].proPrice,
                    style: ts(Colors.black87, 20, false)),
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
