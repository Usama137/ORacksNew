import 'package:flutter/cupertino.dart';

class Brand {
  int brandId;
  String brandName;
  bool active;
  Brand(
      {@required this.brandId, @required this.brandName, this.active = false});
}
