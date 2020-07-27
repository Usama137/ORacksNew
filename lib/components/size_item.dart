import 'package:advika/models/product_size.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class SizeItemComponent extends StatelessWidget {
  final ProductSize productSize;
  final Function updateSize;
  final double widthAndHeight;
  final double fontSize;
  final double marginRight;
  SizeItemComponent({
    Key key,
    @required this.productSize,
    @required this.updateSize,
    @required this.widthAndHeight,
    @required this.fontSize,
    @required this.marginRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    Color backgroundColor = Color.fromRGBO(218, 218, 218, 1);
    if (productSize.active) {
      backgroundColor = kMainBackgroundColor;
    }
    return InkWell(
      onTap: () {
        updateSize(productSize.sizeId);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: scU.scale(marginRight)),
        width: scU.scale(widthAndHeight),
        height: scU.scale(widthAndHeight),
        decoration:
            BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
        child: Text(
          productSize.sizeValue,
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: scU.scale(fontSize),
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
    );
  }
}
