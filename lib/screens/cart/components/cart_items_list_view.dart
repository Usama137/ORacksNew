import 'package:advika/models/cart_item.dart';
import 'package:advika/models/product_quantity.dart';
import 'package:advika/models/product_size.dart';
import 'package:advika/components/drop_down_size.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../constants.dart';
import 'cart_item_buttons.dart';
import '../../../components/drop_down_qty.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({
    Key key,
    @required this.cartItems,
  }) : super(key: key);

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    final List<ProductQuantity> productQuantities = [
      new ProductQuantity(id: 1, value: "1"),
      new ProductQuantity(id: 2, value: "2"),
      new ProductQuantity(id: 3, value: "3"),
      new ProductQuantity(id: 4, value: "4")
    ];
    final List<ProductSize> productSizes = [
      new ProductSize(sizeId: 1, sizeValue: "S"),
      new ProductSize(sizeId: 2, sizeValue: "M"),
      new ProductSize(sizeId: 3, sizeValue: "L"),
      new ProductSize(sizeId: 4, sizeValue: "XL")
    ];
    return ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int prIndex) {
          CartItem cartItem = cartItems[prIndex];
          double scaleFactor = MediaQuery.of(context).textScaleFactor;
          return Container(
            margin: EdgeInsets.only(bottom: scU.scale(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: scU.scale(18)),
                        width: scU.scale(117),
                        height: scU.scale(124),
                        decoration: BoxDecoration(
                          color: kImageDefaultBackgroundColor,
                          borderRadius: BorderRadius.circular(scU.scale(16)),
                        ),
                        child: Image.network(cartItem.thumbUrl,
                            fit: BoxFit.contain, width: double.infinity)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          cartItem.modelCode,
                          textScaleFactor:
                              scaleFactor > 1.15 ? 1.15 : scaleFactor,
                          style: TextStyle(
                              fontSize: scU.scale(13.45),
                              color: Color.fromRGBO(255, 216, 25, 1),
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: scU.scale(3.5)),
                          child: Text(
                            cartItem.title,
                            textScaleFactor:
                                scaleFactor > 1.15 ? 1.15 : scaleFactor,
                            style: TextStyle(
                                fontSize: scU.scale(12.17),
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: scU.scale(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: scU.scale(6)),
                                child: DropDownQtyComponent(
                                  productQuantities: productQuantities,
                                ),
                              ),
                              DropDownSizeComponent(
                                productSizes: productSizes,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: scU.scale(19)),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: scU.scale(8)),
                                child: Text(
                                  "\$" + cartItem.price.toStringAsFixed(2),
                                  textScaleFactor:
                                      scaleFactor > 1.15 ? 1.15 : scaleFactor,
                                  style: TextStyle(
                                      fontSize: scU.scale(10.25),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: scU.scale(8)),
                                child: Text(
                                  "\$" + cartItem.price.toStringAsFixed(2),
                                  textScaleFactor:
                                      scaleFactor > 1.15 ? 1.15 : scaleFactor,
                                  style: TextStyle(
                                      fontSize: scU.scale(10.25),
                                      color: Color.fromRGBO(189, 189, 189, 1),
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.lineThrough
                                  ),
                                ),
                              ),
                              Text(
                                "10% OFF",
                                textScaleFactor:
                                    scaleFactor > 1.15 ? 1.15 : scaleFactor,
                                style: TextStyle(
                                  fontSize: scU.scale(10.25),
                                  color: Color.fromRGBO(232, 28, 28, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: scU.scale(6)),
                          child: Text(
                            "30 Days Easy Return",
                            textScaleFactor:
                                scaleFactor > 1.15 ? 1.15 : scaleFactor,
                            style: TextStyle(
                                fontSize: scU.scale(8),
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          children: <Widget>[],
                        ),
                      ],
                    )
                  ],
                  //product image
                ),
                Padding(
                  padding: EdgeInsets.only(top: scU.scale(16)),
                  child: CartItemButtons(),
                )
              ],
            ),
          );
        });
  }
}
