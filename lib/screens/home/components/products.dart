import 'package:advika/constants.dart';
import 'package:advika/models/category.dart';
import 'package:advika/screens/products/products.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:advika/models/product.dart';
import 'package:advika/screens/product_detail/product_detail.dart';
import 'package:flutter/rendering.dart';

class ProductList extends StatelessWidget {
  final CategoryItem category;
  final List<Product> products;

  const ProductList({
    Key key,
    @required this.products,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
        padding: EdgeInsets.only(left: scU.scale(kMainHorizPadding)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: scU.scale(kMainHorizPadding)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    category.title,
                    style: TextStyle(
                        fontSize: scU.scale(13.45),
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ProductsScreen.path,
                          arguments: category);
                    },
                    child: Text(
                      "Show All".toUpperCase(),
                      style: TextStyle(
                          fontSize: scU.scale(10),
                          color: Color.fromRGBO(184, 184, 184, 1),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: scU.scale(12)),
                height: scU.scale(184),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product product = products[index];
                      return Container(
                        margin: EdgeInsets.only(right: scU.scale(14)),
                        width: 116,
                        height: 184,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductDetailScreen.path,
                                arguments: product);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  width: double.infinity,
                                  height: scU.scale(125),
                                  margin: EdgeInsets.only(bottom: scU.scale(2)), //in psd 7
                                  decoration: BoxDecoration(
                                    color: kImageDefaultBackgroundColor,
                                    borderRadius: BorderRadius.circular(scU.scale(16)),
                                  ),
                                  child: Image.network(product.thumbUrl,
                                      fit: BoxFit.contain,
                                      width: double.infinity)),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                        fontSize: scU.scale(12),
                                        color: Color.fromRGBO(152, 152, 152, 1),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "\$" + product.price.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: scU.scale(10),
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ));
  }
}
