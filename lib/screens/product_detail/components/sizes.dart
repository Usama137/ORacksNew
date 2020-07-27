import 'package:advika/components/size_item.dart';
import 'package:advika/models/product_size.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class SizesComponent extends StatefulWidget {
  @override
  _SizesComponentState createState() => _SizesComponentState();
}

class _SizesComponentState extends State<SizesComponent> {
  List<ProductSize> productSizes;

  @override
  void initState() {
    super.initState();
    productSizes = [
      new ProductSize(
        sizeId: 1,
        sizeValue: "S",
      ),
      new ProductSize(sizeId: 2, sizeValue: "M", active: true),
      new ProductSize(
        sizeId: 3,
        sizeValue: "L",
      ),
      new ProductSize(
        sizeId: 4,
        sizeValue: "XL",
      )
    ];
  }

  updateSize(int sizeId) {
    setState(() {
      productSizes.forEach((e) {
        if (e.sizeId == sizeId) {
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
    List<SizeItemComponent> sizeItems = [];
    productSizes.forEach((element) {
      sizeItems.add(new SizeItemComponent(
          productSize: element,
          updateSize: updateSize,
          widthAndHeight: scU.scale(22),
          fontSize: scU.scale(8.4),
          marginRight: scU.scale(5)));
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Size".toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontSize: scU.scale(10),
                fontWeight: FontWeight.w600)),
        Padding(
          padding: EdgeInsets.only(top: scU.scale(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[...sizeItems],
          ),
        )
      ],
    );
  }
}
