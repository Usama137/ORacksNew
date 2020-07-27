import 'package:advika/components/color_item.dart';
import 'package:advika/models/product_color.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ColorsComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ColorsComponentState();
  }
}

class ColorsComponentState extends State<ColorsComponent> {
  List<ProductColor> productColors;
  @override
  void initState() {
    super.initState();
    productColors = [
      new ProductColor(colorId: 1, colorValue: "0xff87887c", active: true),
      new ProductColor(colorId: 2, colorValue: "0xffe60036"),
      new ProductColor(colorId: 3, colorValue: "0xfff88d3f"),
      new ProductColor(colorId: 4, colorValue: "0xff0793ff")
    ];
  }

  updateColor(int colorId) {
    setState(() {
      productColors.forEach((e) {
        if (e.colorId == colorId) {
          e.active = true;
        } else {
          e.active = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    List<ColorItemComponent> colorItems = [];
    productColors.forEach((element) {
      colorItems.add(new ColorItemComponent(
          productColor: element,
          updateColor: updateColor,
          iconSize: scU.scale(25),
          size: scU.scale(45),
          marginRight: scU.scale(9)));
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Colors".toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontSize: scU.scale(13),
                fontWeight: FontWeight.w600)),
        Padding(
          padding: EdgeInsets.only(top: scU.scale(14)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ...colorItems,
            ],
          ),
        )
      ],
    );
  }
}
