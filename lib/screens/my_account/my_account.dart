import 'package:advika/screens/shipping_to/shipping_to.dart';
import 'package:advika/screens/wishlist/wishlist.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../components/header.dart';
import '../../constants.dart';
import 'components/menu_item.dart';

class MyAccountScreen extends StatelessWidget {
  static final String path = "/my_account";

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Header(
                title: 'My account',
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: scU.scale(7),
                    bottom: scU.scale(28),
                    left: scU.scale(kMainHorizPadding),
                    right: scU.scale(kMainHorizPadding)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: scU.scale(94),
                            height: scU.scale(94),
                            margin: EdgeInsets.only(right: scU.scale(22)),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color.fromRGBO(0, 0, 0, 0.06),
                                  width: scU.scale(3),
                                )),
                            child: Container(
                              alignment: Alignment.center,
                              width: scU.scale(88),
                              height: scU.scale(88),
                              decoration: BoxDecoration(
                                color: kImageDefaultBackgroundColor,
                                shape: BoxShape.circle,
                              ),
                              child: Image(
                                  image:
                                      AssetImage('assets/images/avatar.png')),
                            )),
                        Column(
                          children: <Widget>[
                            Text(
                              "Advik Smith",
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: scU.scale(17.29),
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              "admin@test.ru",
                              style: TextStyle(
                                  fontSize: scU.scale(10.89),
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.6)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _MainBlock(),
              ),
            ],
          ),
        ));
  }
}

class _MainBlock extends StatefulWidget {
  @override
  _MainBlockState createState() => _MainBlockState();
}

class _MainBlockState extends State<_MainBlock> {
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        padding: EdgeInsets.only(
            top: scU.scale(kMainBlockTopPadding),
            bottom: scU.scale(16),
            left: scU.scale(kMainHorizPadding),
            right: scU.scale(kMainHorizPadding)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(scU.scale(kMainBlockRadius)),
              topRight: Radius.circular(scU.scale(kMainBlockRadius))),
        ),
        child: ListView(
          children: <Widget>[
            MenuItemComponent(
                imagePath: 'assets/images/wish.png',
                active: false,
                title: "Wishlist",
                navigationPath: WishListScreen.path),
            MenuItemComponent(
                imagePath: 'assets/images/adress.png',
                active: false,
                title: "Adresses",
                navigationPath: ShippingToScreen.path),
          ],
        ));
  }
}
