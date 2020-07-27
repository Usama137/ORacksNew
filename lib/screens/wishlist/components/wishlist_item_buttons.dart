import 'package:advika/screens/cart/cart.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class WishListItemButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Color.fromRGBO(250, 250, 250, 1)),
              bottom: BorderSide(color: Color.fromRGBO(250, 250, 250, 1)))),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: scU.scale(8), bottom: scU.scale(8)),
                decoration: BoxDecoration(),
                child: Text(
                  "Remove".toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: scU.scale(8)),
                ),
              ),
            ),
            Container(
              width: scU.scale(1),
              color: Color.fromRGBO(250, 250, 250, 1),
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, CartScreen.path);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("add to cart".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: scU.scale(8))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
