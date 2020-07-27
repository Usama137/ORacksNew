import 'package:advika/components/rounded_button.dart';
import 'package:advika/screens/home/home.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../constants.dart';

class CongratulationScreen extends StatelessWidget {
  static final String path = "/congratulation";
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
          child: Align(
            alignment: Alignment(0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/tick.png"),
                  width: scU.scale(94),
                ),
                Padding(
                  padding: EdgeInsets.only(top: scU.scale(24)),
                  child: Text(
                    "Congratulation",
                    style: TextStyle(
                        fontSize: scU.scale(19.21),
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: scU.scale(9)),
                  child: Text(
                    "Your payment is completed\n"
                        "Please check your delivery status",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: scU.scale(11),
                        color: Colors.black
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: scU.scale(24)),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamedAndRemoveUntil(context,
                            HomeScreen.path, (r)=>false);
                      },
                        child: RoundedButton(
                          title: "continue shopping",
                          buttonWidth: scU.scale(244),)
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}