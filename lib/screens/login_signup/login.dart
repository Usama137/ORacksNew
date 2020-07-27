import 'package:advika/components/header.dart';
import 'package:advika/screens/login_signup/components/form.dart';
import 'package:advika/screens/login_signup/signup.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginScreen extends StatelessWidget {
  static final String path = "/login";
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
            child: Container(
                width: MediaQuery.of(context).size.width,
                color: kMainBackgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Header(title: "Login", fontSize: scU.scale(27), returnButton: false),
                      Container(
                        margin: EdgeInsets.only(
                            top: scU.scale(30),
                            bottom: scU.scale(34),
                            left: scU.scale(kMainHorizPadding),
                            right: scU.scale(kMainHorizPadding)),
                        padding: EdgeInsets.only(
                            left: scU.scale(kMainHorizPadding),
                            right: scU.scale(kMainHorizPadding),
                            bottom: scU.scale(25),
                            top: scU.scale(kMainBlockTopPadding)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(scU.scale(kMainBlockRadius)),
                        ),
                        child: FormComponent(),
                      ),
                      Container(
                          padding:
                              EdgeInsets.only(bottom: kMainBlockTopPadding),
                          alignment: Alignment.topCenter,
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: scU.scale(11),
                                  ),
                                  children: [
                                TextSpan(text: "Don’t have an account? "),
                                TextSpan(
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  text: "Sign up",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, SignupScreen.path);
                                    },
                                ),
                              ])))
                    ],
                  ),
                ))));
  }
}
