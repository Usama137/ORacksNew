import 'package:advika/components/rounded_button.dart';
import 'package:advika/constants.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterFooter extends StatelessWidget {
  static double height = 74;
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
      padding: EdgeInsets.only(
          left: scU.scale(kMainHorizPadding), right: scU.scale(kMainHorizPadding), bottom: scU.scale(16)),
      constraints: BoxConstraints(
        minHeight: scU.scale(height),
      ),
      decoration: BoxDecoration(
        color: kMainBackgroundColor,
      ),
      child: Container(
        margin: EdgeInsets.only(top: scU.scale(16)),
        alignment: Alignment.topCenter, //align row to topLeft of header
        child: RoundedButton(
          title: "Apply",
          buttonHeight: scU.scale(45),
        ),
      ),
    );
  }
}
