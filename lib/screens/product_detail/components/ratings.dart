import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class RatingsComponent extends StatelessWidget {
  final List<Widget> stars = [];
  final int activeStars;
  RatingsComponent({Key key, @required this.activeStars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    IconData starIcon;
    for (int i = 1; i <= 5; i++) {
      if (i <= activeStars) {
        starIcon = Icons.star;
      } else {
        starIcon = Icons.star_border;
      }
      stars.add(Padding(
        padding: EdgeInsets.only(right: scU.scale(4)),
        child: Icon(
          starIcon,
          color: kMainBackgroundColor,
          size: scU.scale(13),
        ),
      ));
    }
    return Row(
      children: <Widget>[...stars],
    );
  }
}
