import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchComponent extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchComponent({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
      textScaleFactor: mqData.textScaleFactor >= 1.15 ? 1.12 : mqData.textScaleFactor,

    );
    return MediaQuery(data: mqDataNew,
        child: Container(
            alignment: Alignment.centerLeft,
            height: scU.scale(30),
            padding: EdgeInsets.symmetric(horizontal: scU.scale(20)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: TextField(
              decoration: new InputDecoration(
                isDense: true,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: scU.scale(1.5)),
                hintText: "Search Jeans, T-Shirt",
                hintStyle: TextStyle(
                  fontSize: scU.scale(10.5),
                  color: Color.fromRGBO(161, 161, 161, 1),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(top: scU.scale(3.0)),
                  child: Icon(
                    Icons.search,
                    size: scU.scale(12),
                    color: Color.fromRGBO(161, 161, 161, 1),
                  ),
                ),
              ),
            )),
      );


  }
}
