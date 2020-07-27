import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class TextRowComponent extends StatelessWidget {
  final String title;
  final String value;
  final bool bold;
  const TextRowComponent({Key key, this.title, this.value, this.bold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    FontWeight fontWeight = FontWeight.w600;
    Color color = Color.fromRGBO(136, 136, 136, 1);
    if (bold) {
      fontWeight = FontWeight.w700;
      color = Colors.black;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: scU.scale(12.17),
            fontWeight: fontWeight,
            color: color,
          ),
        ),
        Text(
          value,
          style:
              TextStyle(fontSize: scU.scale(12.17), fontWeight: fontWeight, color: color),
        ),
      ],
    );
  }
}
