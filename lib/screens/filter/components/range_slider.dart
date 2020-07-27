import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class RangeSliderComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RangeSliderComponentState();
}

class RangeSliderComponentState extends State<RangeSliderComponent> {
  double _lowerValue;
  double _upperValue;
  @override
  void initState() {
    super.initState();
    _lowerValue = 0;
    _upperValue = 1000;
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Padding(
      padding: EdgeInsets.only(left: scU.scale(10), right: scU.scale(10), top: scU.scale(10)),
      child: FlutterSlider(
        handlerHeight: scU.scale(13 * 1.2),
        handlerWidth: scU.scale(13 * 1.2),
        handlerAnimation: FlutterSliderHandlerAnimation(
            curve: Curves.elasticOut,
            reverseCurve: Curves.bounceIn,
            duration: Duration(milliseconds: 500),
            scale: 1.2),
        trackBar: FlutterSliderTrackBar(
            activeTrackBarHeight: scU.scale(3),
            inactiveTrackBarHeight: scU.scale(3),
            activeTrackBar: BoxDecoration(color: Colors.black),
            inactiveDisabledTrackBarColor: Color.fromRGBO(218, 218, 218, 1)),
        tooltip: FlutterSliderTooltip(
            alwaysShowTooltip: true,
            custom: (value) {
              return Text(
                "\$" + value.toInt().toString(),
                textScaleFactor: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: scU.scale(11),
                  color: Color.fromRGBO(179, 179, 179, 1),
                ),
              );
            },
            positionOffset: FlutterSliderTooltipPositionOffset(
              top: scU.scale(25),
            )),
        handler: FlutterSliderHandler(
          decoration: BoxDecoration(),
          child: Container(
            height: scU.scale(13),
            width: scU.scale(13),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          ),
        ),
        rightHandler: FlutterSliderHandler(
          decoration: BoxDecoration(),
          child: Container(
            height: scU.scale(13),
            width: scU.scale(13),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          ),
        ),
        values: [_lowerValue, _upperValue],
        rangeSlider: true,
        max: 1000,
        min: 0,
        onDragging: (handlerIndex, lowerValue, upperValue) {
          _lowerValue = lowerValue;
          _upperValue = upperValue;
          setState(() {});
        },
      ),
    );
  }
}
