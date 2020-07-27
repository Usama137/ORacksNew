import 'package:advika/models/category.dart';
import 'package:advika/screens/products/products.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List<CategoryItem> data;

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int catIndex) {
          CategoryItem category = data[catIndex];
          //dropdownValue =
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProductsScreen.path,
                        arguments: category);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: scU.scale(18)),
                            width: scU.scale(68),
                            height: scU.scale(72),
                            decoration: BoxDecoration(
                              color: kImageDefaultBackgroundColor,
                              borderRadius: BorderRadius.circular(scU.scale(9)),
                            ),
                            child: Image.network(category.imagePath,
                                fit: BoxFit.contain, width: double.infinity),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                category.title,
                                style: TextStyle(
                                    fontSize: scU.scale(16),
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: scU.scale(6)),
                                child: Text(
                                  category.itemsInCategory.toString() +
                                      " Items",
                                  style: TextStyle(
                                    fontSize: scU.scale(13.45),
                                    color: Color.fromRGBO(152, 152, 152, 1),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                        //product image
                      ),

                      //IconBitton
                      Padding(
                        padding: EdgeInsets.only(left: scU.scale(15)),
                        child: Container(
                          padding: EdgeInsets.all(scU.scale(10)),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color.fromRGBO(223, 223, 223, 1),
                              )),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: scU.scale(9),
                            color: Color.fromRGBO(223, 223, 223, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: scU.scale(17)),
                    child: Divider())
              ],
            ),
          );
        });
  }
}
