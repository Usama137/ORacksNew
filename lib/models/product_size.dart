import 'package:flutter/cupertino.dart';

class ProductSize {
  int sizeId;
  String sizeValue;
  bool active;
  ProductSize(
      {@required this.sizeId, @required this.sizeValue, this.active = false});
}
