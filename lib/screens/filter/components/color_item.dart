import 'package:advika/models/product_color.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class ColorItemComponent extends StatelessWidget {
  final ProductColor productColor;
  final Function updateColor;
  ColorItemComponent(
      {Key key, @required this.productColor, @required this.updateColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return InkWell(
      onTap: () {
        updateColor(productColor.colorId);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: scU.scale(9)),
        width: scU.scale(45),
        height: scU.scale(45),
        decoration: BoxDecoration(
            color: Color(int.parse(productColor.colorValue)),
            shape: BoxShape.circle),
        child: Visibility(
          visible: productColor.active,
          child: Icon(
            Icons.check,
            size: scU.scale(25),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
