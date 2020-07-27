import 'package:flutter/cupertino.dart';

class ProductColor {
  int colorId;
  String colorValue;
  bool active;
  ProductColor(
      {@required this.colorId, @required this.colorValue, this.active = false});
}
