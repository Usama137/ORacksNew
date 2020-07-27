import 'package:advika/models/shipping_to.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class AddressesListView extends StatelessWidget {
  const AddressesListView({
    Key key,
    @required this.shippingToList,
    @required this.additionalSpace,
  }) : super(key: key);

  final List<ShippingTo> shippingToList;
  final double additionalSpace;

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return ListView.builder(
        itemCount: shippingToList.length,
        itemBuilder: (BuildContext context, int index) {
          ShippingTo shippingTo = shippingToList[index];
          Color colorOfRoundIcon = Color.fromRGBO(196, 196, 196, 1);
          if (shippingTo.active) {
            colorOfRoundIcon = kMainBackgroundColor;
          }
          return Stack(children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: scU.scale(20), horizontal: scU.scale(17)),
              margin: EdgeInsets.only(
                  top: scU.scale(additionalSpace), bottom: scU.scale(16 - additionalSpace)),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(248, 248, 248, 1),
                  borderRadius: BorderRadius.circular(scU.scale(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: scU.scale(16)),
                    width: scU.scale(22),
                    height: scU.scale(22),
                    decoration: BoxDecoration(
                        color: colorOfRoundIcon, shape: BoxShape.circle),
                    child: Icon(
                      Icons.check,
                      size: scU.scale(13),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    //color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: scU.scale(6)),
                          child: Text(
                            shippingTo.addressTxtRow1,
                            style: TextStyle(
                                fontSize: scU.scale(13.45),
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: scU.scale(6)),
                          child: Row(
                            children: <Widget>[
                              Text(
                                shippingTo.addressTxtRow2,
                                style: TextStyle(
                                    fontSize: scU.scale(12.17),
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(152, 152, 152, 1)),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              shippingTo.addressTxtRow3,
                              style: TextStyle(
                                  fontSize: scU.scale(12.17),
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(152, 152, 152, 1)),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                alignment: Alignment.center,
                width: scU.scale(18),
                height: scU.scale(18),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 97, 87, 1),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.remove,
                  size: scU.scale(13),
                  color: Colors.white,
                ),
              ),
            ),
          ]);
        });
  }
}
