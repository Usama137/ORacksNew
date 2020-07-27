import 'package:advika/utils/scale_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:advika/screens/payment/components/hidden_numbers.dart';
import 'package:flutter/material.dart';

class BankCardSlider extends StatelessWidget {
  final double bankCardHeight;
  BankCardSlider({
    Key key,
    this.bankCardHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: LayoutBuilder(
          builder: (context, constraints) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
            return CarouselSliderComponent(bankCardHeight: bankCardHeight);
          },
        ));
  }
}

class CarouselSliderComponent extends StatelessWidget {
  final double bankCardHeight;
  const CarouselSliderComponent({Key key, this.bankCardHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return CarouselSlider(
      options: CarouselOptions(height: scU.scale(bankCardHeight), viewportFraction: 0.85),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              padding:
                  EdgeInsets.only(left: scU.scale(29), right: scU.scale(29), top: scU.scale(28), bottom: scU.scale(16)),
              constraints:
                  BoxConstraints(maxHeight: scU.scale(bankCardHeight), maxWidth: scU.scale(296)),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(scU.scale(16)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: AssetImage(
                      'assets/images/visa.png',
                    ),
                    width: scU.scale(76),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: scU.scale(32)),
                    child: Text("Advik Smith",
                        textScaleFactor: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: scU.scale(12.17),
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      HiddenNumbers(),
                      Text("1234",
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: scU.scale(12.17),
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
