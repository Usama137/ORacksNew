import 'package:advika/models/category.dart';
import 'package:advika/screens/login_signup/login.dart';
import 'package:advika/screens/my_account/my_account.dart';
import 'package:advika/screens/products/products.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'categories/categories.dart';

class MainDrawer extends StatelessWidget {
  static const double iconWidth = 20;
  static const double menuItemFontSize = 18.57;
  static const double nameFontSize = 17.29;
  static const double emailFontSize = 10.89;
  static const double menuIconRightMargin = 16;
  static const double spaceSizeBetweenMenuItems = 29;
  final Function updateParent;
  const MainDrawer({
    Key key,
    @required this.updateParent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: kMainBackgroundColor,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: scU.scale(32), right: scU.scale(22)),
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: scU.scale(30), bottom: scU.scale(56)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: scU.scale(94),
                            height: scU.scale(94),
                            margin: EdgeInsets.only(top: scU.scale(29), bottom: scU.scale(10)),
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
                        Text(
                          "Advik Smith",
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: scU.scale(nameFontSize),
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          "admin@test.ru",
                          style: TextStyle(
                              fontSize: scU.scale(emailFontSize),
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 0.6)),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: scU.scale(2)),
                      child: InkWell(
                        onTap: () {
                          updateParent();
                        },
                        child: Image(
                          image: AssetImage('assets/images/close.png'),
                          width: scU.scale(28),
                        ),
                      ),
                    ),
                  ],
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      right: scU.scale(menuIconRightMargin),
                      bottom: scU.scale(spaceSizeBetweenMenuItems)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyAccountScreen.path);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: scU.scale(menuIconRightMargin)),
                          child:FaIcon(
                            FontAwesomeIcons.userAlt,
                            color: Colors.black,
                            size: scU.scale(iconWidth),
                          ),
                        ),
                        Text(
                          "My account",
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontSize: scU.scale(menuItemFontSize),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: scU.scale(menuIconRightMargin),
                      bottom: scU.scale(spaceSizeBetweenMenuItems)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ProductsScreen.path,
                          arguments:
                              CategoryItem(id: 1, title: "New Collection"));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: scU.scale(menuIconRightMargin)),
                          child: Image(
                            image: AssetImage(
                              'assets/images/lay.png',
                            ),
                            width: iconWidth,
                          ),
                        ),
                        Text(
                          "New Collection",
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontSize: scU.scale(menuItemFontSize),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: scU.scale(menuIconRightMargin),
                      bottom: scU.scale(spaceSizeBetweenMenuItems)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CategoriesScreen.path);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: scU.scale(menuIconRightMargin)),
                          child: Image(
                            image: AssetImage(
                              'assets/images/categories.png',
                            ),
                            width: iconWidth,
                          ),
                        ),
                        Text(
                          "Categories",
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontSize:scU.scale(menuItemFontSize),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: scU.scale(menuIconRightMargin),
                      bottom: scU.scale(spaceSizeBetweenMenuItems)),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(context,
                          LoginScreen.path, (r)=>false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: scU.scale(menuIconRightMargin)),
                          child: Image(
                            image: AssetImage(
                              'assets/images/logout.png',
                            ),
                            width: iconWidth,
                          ),
                        ),
                        Text(
                          "Logout",
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontSize: scU.scale(menuItemFontSize),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
