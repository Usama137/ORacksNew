import 'package:advika/models/product_quantity.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class DropDownQtyComponent extends StatefulWidget {
  final List<ProductQuantity> productQuantities;
  const DropDownQtyComponent({
    Key key,
    @required this.productQuantities,
  }) : super(key: key);
  
  @override
  State<StatefulWidget> createState() {
    return DropDownQtyComponentState();
  }
}

class DropDownQtyComponentState extends State<DropDownQtyComponent> {
  List<ProductQuantity> productQuantities;
  ProductQuantity selectedQuantity;
  @override
  void initState() {
    super.initState();
    productQuantities = widget.productQuantities;
    selectedQuantity = productQuantities[0];
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
          child: DropdownButton<ProductQuantity>(
            icon: Icon(
              Icons.arrow_drop_down,
              size: scU.scale(16),
              color: Colors.black,
            ),
            isDense: true,
            onChanged: (ProductQuantity newValue) {
              setState(() {
                selectedQuantity = newValue;
              });
            },
            value: selectedQuantity,
            items: productQuantities.map((e) {
              return DropdownMenuItem<ProductQuantity>(
                value: e,
                child: Text(
                  "QTY: " + e.value,
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
