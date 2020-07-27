import 'package:advika/components/cart_indicator.dart';
import 'package:advika/constants.dart';
import 'package:advika/screens/filter/filter.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget {
  static double height = 75;
  final String title;
  final double fontSize;
  final bool returnButton;
  final bool cartIndicator;
  final bool filter;
  const Header(
      {Key key,
      this.title = "",
      this.fontSize = 20.49,
      this.returnButton = true,
      this.cartIndicator = false,
      this.filter = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    double iconRightPadding = 0;
    if (cartIndicator) {
      iconRightPadding = 16;
    }
    return Container(
      padding: EdgeInsets.only(
          top: scU.scale(36), left: scU.scale(kMainHorizPadding), right: scU.scale(kMainHorizPadding)),
      constraints: BoxConstraints(
        maxHeight: scU.scale(height),
      ),
      decoration: BoxDecoration(
        color: kMainBackgroundColor,
      ),
      child: Container(
        alignment: Alignment.topLeft, //align row to topLeft of header
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: scU.scale(46),
              height: scU.scale(20.49),
              alignment: Alignment.topLeft,
              child: Visibility(
                visible: returnButton,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: scU.scale(5)),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: scU.scale(20.49),
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: scU.scale(10)),
                child: Text(
                  title,
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              width: scU.scale(46),
              height: scU.scale(17),
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                      visible: filter,
                      child: Padding(
                        padding: EdgeInsets.only(right: scU.scale(iconRightPadding)),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, FilterScreen.path);
                          },
                          child: Image(
                            image: AssetImage('assets/images/filter.png'),
                            width: scU.scale(14),
                          ),
                        ),
                      )),
                  Visibility(
                    visible: cartIndicator,
                    child: CartIndicator(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
