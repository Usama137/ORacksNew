import 'package:advika/models/product.dart';
import 'package:advika/screens/products/components/products_item.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    Key key,
    @required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
      width: scU.scale(296),
      alignment: Alignment.topCenter,
      child: GridView.builder(
          itemCount: products.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 136 / 219,
              crossAxisSpacing: scU.scale(24)),
          itemBuilder: (BuildContext context, int prIndex) {
            Product product = products[prIndex];
            return Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(bottom: scU.scale(10)),
              child: ProductItemComponent(product: product),
            );
          }),
    );
  }
}
