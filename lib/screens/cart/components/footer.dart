import 'package:advika/components/rounded_button.dart';
import 'package:advika/constants.dart';
import 'package:advika/screens/payment/payment.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartFooter extends StatelessWidget {
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
        margin: EdgeInsets.only(top:scU.scale(16)),
        alignment: Alignment.topLeft, //align row to topLeft of header
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "total".toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: scU.scale(8),
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: scU.scale(2), bottom: scU.scale(3)),
                    child: Text(
                      "90.00".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: scU.scale(19),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, PaymentScreen.path);
                },
                child: RoundedButton(
                  title: "Place order",
                  buttonHeight: scU.scale(42),
                  buttonWidth: scU.scale(149),
                ))
          ],
        ),
      ),
    );
  }
}
