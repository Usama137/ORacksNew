import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class DeviderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: scU.scale(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: scU.scale(1),
              color: Color.fromRGBO(238, 238, 238, 1),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: scU.scale(5)),
            child: Text(
              "OR",
              style: TextStyle(
                  fontSize: scU.scale(11.53),
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.5)),
            ),
          ),
          Expanded(
            child: Container(
              height: scU.scale(1),
              color: Color.fromRGBO(238, 238, 238, 1),
            ),
          ),
        ],
      ),
    );
  }
}
