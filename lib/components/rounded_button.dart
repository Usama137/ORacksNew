import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  final String title;

  RoundedButton({
    Key key,
    this.buttonHeight = 45,
    this.buttonWidth = 340,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    double borderRadius = 0.5 * scU.scale(buttonHeight);
    return Container(
        alignment: Alignment.center,
        height: scU.scale(buttonHeight),
        constraints: BoxConstraints(maxWidth: scU.scale(buttonWidth)),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: scU.scale(11),
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ));
  }
}
