import 'package:advika/models/brand.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class BrandsItemComponent extends StatelessWidget {
  static const double iconWidth = 19;
  static const double menuItemFontSize = 11;

  final Brand brand;
  final Function updateBrands;
  BrandsItemComponent({
    Key key,
    @required this.brand,
    @required this.updateBrands,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    Color titleColor = Color.fromRGBO(120, 120, 120, 1);
    Color iconColor = Colors.transparent;
    FontWeight fontWeight = FontWeight.w600;

    if (brand.active) {
      titleColor = Colors.black;
      iconColor = Colors.black;
      fontWeight = FontWeight.w700;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            updateBrands(brand.brandId);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: scU.scale(8)),
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  brand.brandName.toUpperCase(),
                  style: TextStyle(
                    fontSize: scU.scale(menuItemFontSize),
                    fontWeight: fontWeight,
                    color: titleColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: scU.scale(8), right: scU.scale(8)),
                  child: Container(
                    child: Icon(
                      Icons.check,
                      size: scU.scale(12),
                      color: iconColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Container(
            height: scU.scale(1),
            color: Color.fromRGBO(229, 229, 229, 1),
          ),
        )
      ],
    );
  }
}
