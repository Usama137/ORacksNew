import 'package:advika/models/product_color.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class ColorItemComponent extends StatelessWidget {
  final ProductColor productColor;
  final Function updateColor;
  final double size;
  final double iconSize;
  final double marginRight;
  ColorItemComponent({
    Key key,
    @required this.productColor,
    @required this.updateColor,
    @required this.size,
    @required this.iconSize,
    @required this.marginRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return InkWell(
      onTap: () {
        updateColor(productColor.colorId);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: scU.scale(marginRight)),
        width: scU.scale(size),
        height: scU.scale(size),
        decoration: BoxDecoration(
            color: Color(int.parse(productColor.colorValue)),
            shape: BoxShape.circle),
        child: Visibility(
          visible: productColor.active,
          child: Icon(
            Icons.check,
            size: scU.scale(iconSize),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
