import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThinButtonComponent extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;

  const ThinButtonComponent(
      {Key key,
      @required this.color,
      @required this.title,
      @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    final double buttonHeight = 34;
    double borderRadius = scU.scale(0.5 * buttonHeight);
    return Container(
        constraints: BoxConstraints(),
        alignment: Alignment.center,
        height: scU.scale(buttonHeight),
        margin: EdgeInsets.only(bottom: scU.scale(11)),
        padding: EdgeInsets.symmetric(horizontal: scU.scale(22)),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: scU.scale(15)),
              child: FaIcon(icon, size: scU.scale(15), color: Colors.white),
            ),
            Text(
              title.toUpperCase(),
              textScaleFactor: 1,
              style: TextStyle(
                fontSize: scU.scale(11, minSize: 10),
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ));
  }
}
