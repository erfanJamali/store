import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_pages/home_page.dart';
import '../static_data/products.dart';
import 'package:store/functions/textStyle.dart';
import '../sub_pages/ProductInfo_page.dart';

Widget productCard(context, int whichProduct, int casePro) {
  return Container(
    height: thisSize.height * 0.3,
    width: thisSize.width * 0.4,
    margin: EdgeInsets.only(
        left: (thisSize.width * 0.1) / 2, right: (thisSize.width * 0.1) / 2),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.blueGrey),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        proInfoIndex = whichProduct;
        Navigator.push(
            context,
            CupertinoDialogRoute(
                builder: (context) => const ProductInfo_page(),
                context: context));
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
          Text(
              (casePro == 0)
                  ? ProductsList[whichProduct].proName
                  : (casePro == 1)
                      ? ProductsList[whichProduct].proPrice
                      : (casePro == 2)
                          ? ProductsList[whichProduct].proPost
                          : ProductsList[whichProduct].proBought,
              style: myTextStyle.ts(Colors.white, 20, true)),
          const Spacer(),
        ],
      ),
    ),
  );
}

Widget searchProductCard(context, int whichProduct, int casePro) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
      proInfoIndex = whichProduct;
      Navigator.push(
          context,
          CupertinoDialogRoute(
              builder: (context) => const ProductInfo_page(),
              context: context));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: thisSize.height * 0.2,
            width: thisSize.width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(ProductsList[whichProduct].proPic),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                (casePro == 0)
                    ? ProductsList[whichProduct].proName
                    : (casePro == 1)
                        ? ProductsList[whichProduct].proPrice
                        : (casePro == 2)
                            ? ProductsList[whichProduct].proPost
                            : ProductsList[whichProduct].proBought,
                style: myTextStyle.ts(Colors.white, 20, true),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
