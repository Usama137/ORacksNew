import 'dart:async';
import 'package:advika/screens/walkthrough/walkthrough.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class SplashScreen extends StatefulWidget {
  static final String path = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
        (){
          Navigator.pushNamedAndRemoveUntil(context,
              WalkthroughScreen.path, (r)=>false);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
            child: Center(
          child: Container(
            constraints: BoxConstraints(
                ),
            alignment: Alignment.center,
            child: Text(
              "advika",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: scU.scale(54)),
            ),
          ),
        )));
  }


}
