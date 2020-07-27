import 'package:advika/models/product.dart';
import 'package:advika/screens/product_detail/product_detail.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductItemComponent extends StatelessWidget {
  final Product product;
  ProductItemComponent({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreen.path,
            arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(),
              margin: EdgeInsets.only(bottom: scU.scale(13)),
              width: scU.scale(136),
              height: scU.scale(144),
              decoration: BoxDecoration(
                color: kImageDefaultBackgroundColor,
                borderRadius: BorderRadius.circular(scU.scale(10)),
              ),
              child: Image.network(product.thumbUrl,
                  fit: BoxFit.contain, width: double.infinity)),
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
      ),
    );
  }
}
