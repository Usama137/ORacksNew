import 'package:advika/models/product.dart';
import 'package:advika/screens/products/components/products_list.dart';
import 'package:advika/services/fetch_products.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:advika/components/header.dart';
import 'package:advika/models/category.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../constants.dart';

class ProductsScreen extends StatelessWidget {
  static final String path = "/products";

  @override
  Widget build(BuildContext context) {
    final CategoryItem category =
        ModalRoute.of(context).settings.arguments as CategoryItem;
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
            child: Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
                color:
                    kMainBackgroundColor, // background for screen, if not put< will be possible see parts of menu
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Header(
                      title: category.title,
                      cartIndicator: true,
                      filter: true,
                    ),
                    Expanded(
                      child: _MainBlock(),
                    ),
                  ],
                ))));
  }
}

class _MainBlock extends StatefulWidget {
  @override
  _MainBlockState createState() => _MainBlockState();
}

class _MainBlockState extends State<_MainBlock> {
  double screenWidth, screenHeight;
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      constraints: BoxConstraints(),
      padding: EdgeInsets.only(
          top: scU.scale(34),
          bottom: 0,
          left: scU.scale(kMainHorizPadding),
          right: scU.scale(kMainHorizPadding)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(scU.scale(kMainBlockRadius)),
            topRight: Radius.circular(scU.scale(kMainBlockRadius))),
      ),
      child: FutureBuilder<List<Product>>(
          future: fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> data = snapshot.data;
              return ProductsListView(products: data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Container(
                alignment: Alignment.center,
                width: scU.scale(60),
                height: scU.scale(60),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      kCircularProgressIndicatorColor),
                ));
          }),
    );
  }
}
