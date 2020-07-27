import 'package:advika/models/product_size.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class DropDownSizeComponent extends StatefulWidget {
  final List<ProductSize> productSizes;
  const DropDownSizeComponent({
    Key key,
    @required this.productSizes,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DropDownSizeComponentState();
  }
}

class DropDownSizeComponentState extends State<DropDownSizeComponent> {
  List<ProductSize> productSizes;
  ProductSize selectedSize;
  @override
  void initState() {
    super.initState();
    productSizes = widget.productSizes;
    selectedSize = productSizes[0];
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
      padding: EdgeInsets.only(left: scU.scale(6), right: scU.scale(1)),
      height: scU.scale(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(scU.scale(5.0)),
        border: Border.all(color: Color.fromRGBO(241, 241, 241, 1), width: scU.scale(1)),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          height: scU.scale(20),
          child: DropdownButton<ProductSize>(
            icon: Icon(
              Icons.arrow_drop_down,
              size: scU.scale(16),
              color: Colors.black,
            ),
            isDense: true,
            onChanged: (ProductSize newValue) {
              setState(() {
                selectedSize = newValue;
              });
            },
            value: selectedSize,
            items: productSizes.map((e) {
              return DropdownMenuItem<ProductSize>(
                value: e,
                child: Text(
                  "SIZE: " + e.sizeValue,
                  textScaleFactor: 1,
                  style: TextStyle(fontSize: scU.scale(10), color: Colors.black),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
