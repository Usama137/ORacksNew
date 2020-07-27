import 'package:advika/screens/cart/cart.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddToCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CartScreen.path);
      },
      child: Container(
          alignment: Alignment.center,
          height: scU.scale(45),
          constraints: BoxConstraints(maxWidth: scU.scale(296)),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(0.5 * scU.scale(45)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: scU.scale(7)),
                child: Icon(
                  Icons.shopping_cart,
                  size: scU.scale(14),
                  color: Colors.white,
                ),
              ),
              Text(
                "Add to cart".toUpperCase(),
                style: TextStyle(
                  fontSize: scU.scale(11),
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )),
    );
  }
}
