import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class MenuItemComponent extends StatelessWidget {
  static const double iconWidth = 19;
  static const double menuItemFontSize = 18.57;
  static const double menuIconRightMargin = 22;
  final bool active;
  final String imagePath;
  final String title;
  final String navigationPath;
  const MenuItemComponent({
    Key key,
    @required this.active,
    @required this.imagePath,
    @required this.title,
    @required this.navigationPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    double opacity = 0.3;
    if (active) {
      opacity = 1;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: scU.scale(51),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, navigationPath);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: scU.scale(menuIconRightMargin)),
                      child: Opacity(
                        opacity: opacity,
                        child: Image(
                          image: AssetImage(
                            imagePath,
                          ),
                          width: scU.scale(iconWidth),
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: scU.scale(scU.scale(menuItemFontSize)),
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 0, 0, opacity)),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: scU.scale(9), right: scU.scale(9)),
                  child: Container(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: scU.scale(12),
                      color: Color.fromRGBO(204, 204, 204, 1),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: scU.scale(1),
          color: Color.fromRGBO(243, 243, 243, 1),
        )
      ],
    );
  }
}
