import 'package:advika/components/slide_indicators.dart';
import 'package:advika/screens/login_signup/login.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:advika/screens/home/home.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/widgets.dart';


import '../../constants.dart';

class WalkthroughScreen extends StatelessWidget {
  static final String path = "/walkthrough";
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: PageView(
          controller: controller,
          children: <Widget>[
            _Page(
              title: "15 Days Money Return",
              /*text:
                  "This section is dedicated for company's policy about money return for the product. ",*/
              imagePath: "assets/images/mb.png",
              amountOfPages: 3,
              currentIndex: 0,
            ),
            _Page(
              title: "Free Home Delivery",
              /*text:
                  "This section is dedicated for free home delivery policy (distance etc).",*/
              imagePath: "assets/images/dp1.png",
              amountOfPages: 3,
              currentIndex: 1,
            ),
            _Page(
              title: "Secure Payment",
             /* text:
                  "This section is dedicated for the medium the company is using for payments (COD, Paypall, JazzCash etc). ",*/
              imagePath: "assets/images/sp1.png",
              amountOfPages: 3,
              currentIndex: 2,
              isLastPage: true,
            )
          ],
        )));
  }
}

class _Page extends StatelessWidget {
  final String title;
  //final String text;
  final String imagePath;
  final bool isLastPage;
  final int amountOfPages;
  final int currentIndex;

  const _Page(
      {Key key,
      @required this.title,
      //@required this.text,
      @required this.imagePath,
      @required this.amountOfPages,
      @required this.currentIndex,
      this.isLastPage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return GestureDetector(
      child: Container(
        alignment: Alignment(-1.0, 0.0),
        color: kMainBackgroundColor,
        padding: EdgeInsets.symmetric(
            horizontal: scU.scale(kMainHorizPadding), vertical: scU.scale(11)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "ORacks",
                      style: TextStyle(
                        fontSize: 43,
                        color: Colors.black

                      ),

                    )
                  ],
                ),
              ),
            ),

            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: scU.scale(225), maxHeight: scU.scale(200)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Center(
                        child: Image(
                          width: scU.scale(101),
                          image: AssetImage(imagePath),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: scU.scale(13), bottom: scU.scale(11)),
                        child: Center(
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: scU.scale(19.21),
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      /*Text(
                        text,
                        style: TextStyle(
                          fontSize: scU.scale(11),
                          color: Colors.black,
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
            ),

            /*Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SlideIndocatorsComponent(

                      amountOfSlides: amountOfPages,
                      currentIndex: currentIndex,
                      itemMarginRight: 8,
                      sizeInactive: 7,
                      sizeActive: 21)
                ],
              ),
            )*/

            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        DotsIndicator(
                          dotsCount: amountOfPages,
                          position: currentIndex.roundToDouble(),
                          decorator: DotsDecorator(
                            color: Colors.black87, // Inactive color
                            activeColor: Colors.white,
                          ),
                        )
                      ],
                  ),
                ),
              ),
            ),

            Flexible(
              flex: 1,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(

                    //borderRadius: BorderRadius.all(10),

                    onTap: () {
                      Navigator.pushNamed(context, HomeScreen.path);
                    },

                    child: Padding(


                      padding: EdgeInsets.all(scU.scale(3.0)),
                      child: Text(
                        "SKIP",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: scU.scale(15),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
