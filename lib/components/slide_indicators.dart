import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class SlideIndocatorsComponent extends StatelessWidget {
  final int amountOfSlides;
  final int currentIndex;
  final double itemMarginRight;
  final double sizeInactive;
  final double sizeActive;
  SlideIndocatorsComponent(
      {Key key,
      @required this.amountOfSlides,
      @required this.currentIndex,
      @required this.itemMarginRight,
      @required this.sizeInactive,
      @required this.sizeActive})
      : super(key: key);

  getActivePassiveList() {
    List<bool> activePassiveList = List.generate(amountOfSlides, (index) {
      if (currentIndex == index) {
        return true;
      } else {
        return false;
      }
    });
    List widgetList = [];
    activePassiveList.asMap().forEach((key, value) {
      double marginRight = itemMarginRight;
      if (key + 1 == activePassiveList.length) {
        marginRight = 0;
      }
      widgetList.add(SlideIndicatorsItem(
          active: value,
          marginRight: marginRight,
          sizeInactive: sizeInactive,
          sizeActive: sizeActive));
    });
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ...getActivePassiveList(),
      ],
    );
  }
}

class SlideIndicatorsItem extends StatelessWidget {
  final bool active;
  final double marginRight;
  final double sizeInactive;
  final double sizeActive;
  const SlideIndicatorsItem(
      {Key key,
      this.active = false,
      this.marginRight = 0.0,
      @required this.sizeInactive,
      @required this.sizeActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    double width = sizeInactive;
    double height = sizeInactive;
    double borderRadius = 0.5 * height;
    if (active) {
      borderRadius = 0.5 * height;
      width = sizeActive;
    }

    return Container(
      margin: EdgeInsets.only(right: scU.scale(marginRight)),
      width: scU.scale(width),
      height: scU.scale(sizeInactive),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(scU.scale(borderRadius))),
    );
  }
}
