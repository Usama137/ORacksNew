import 'package:advika/constants.dart';
import 'package:advika/models/category.dart';
import 'package:advika/models/product.dart';
import 'package:advika/screens/home/components/products.dart';
import 'package:advika/services/fetch_best_seller.dart';
import 'package:advika/services/fetch_new_collection.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

import 'banner.dart';

class MainContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainContentState();
  }
}

class _MainContentState extends State<MainContent> {
  CategoryItem newCollectionCat = CategoryItem(id: 1, title: "New Collection");
  CategoryItem bestSellerCat = CategoryItem(id: 2, title: "Best Seller");

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: scU.scale(kMainBlockTopPadding)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(scU.scale(kMainBlockRadius)),
              topRight: Radius.circular(scU.scale(kMainBlockRadius))),
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                BannerComponent(),
                Padding(
                  padding: EdgeInsets.only(top: scU.scale(30)),
                  child: FutureBuilder<List<Product>>(
                      future: fetchNewCollectionProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Product> products = snapshot.data;
                          return ProductList(
                            products: products,
                            category: newCollectionCat,
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Container(
                            alignment: Alignment.center,
                            height: scU.scale(184),
                            child: Container(
                                alignment: Alignment.center,
                                width: scU.scale(60),
                                height: scU.scale(60),
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      kCircularProgressIndicatorColor),
                                )));
                      }),
                ),
                FutureBuilder<List<Product>>(
                    future: fetchBestSellerProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Product> products = snapshot.data;
                        return ProductList(
                            products: products, category: bestSellerCat);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Container(
                          alignment: Alignment.center,
                          height: scU.scale(184),
                          child: Container(
                              alignment: Alignment.center,
                              width: scU.scale(60),
                              height: scU.scale(60),
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    kCircularProgressIndicatorColor),
                              )));
                    }),
              ]),
        ));
  }
}
