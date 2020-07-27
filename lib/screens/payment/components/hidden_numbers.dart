import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class HiddenNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    double marginRight;
    List<Container> dotItems = new List<Container>.generate(12, (i) {
      if ((i + 1) % 4 == 0 && (i + 1) != 1) {
        marginRight = 10;
      } else {
        marginRight = 1;
      }
      return Container(
        margin: EdgeInsets.only(right: scU.scale(marginRight)),
        width: scU.scale(5),
        height: scU.scale(5),
        decoration: BoxDecoration(
            color: Color.fromRGBO(141, 141, 141, 1), shape: BoxShape.circle),
      );
    });
    return Row(
      children: <Widget>[...dotItems],
    );
  }
}
