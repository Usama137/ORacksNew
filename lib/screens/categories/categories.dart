import 'package:advika/models/category_filter.dart';
import 'package:advika/screens/categories/components/categoryFilterItem.dart';
import 'package:advika/services/fetch_categories.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:advika/components/header.dart';
import 'package:advika/models/category.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../constants.dart';
import 'components/categories_list_view.dart';

class CategoriesScreen extends StatelessWidget {
  static final String path = "/categories";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
            child: Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
                color: kMainBackgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Header(title: "Categories", cartIndicator: true),
                    Expanded(
                      child: _MainBlock(),
                    ),
                  ],
                ))));
  }
}

class _MainBlock extends StatefulWidget {
  @override
  _MainBlockState createState() => _MainBlockState();
}

class _MainBlockState extends State<_MainBlock> {
  List<CategoryFilterItem> categoryFilterItems = [
    CategoryFilterItem(title: "All", active: true),
    CategoryFilterItem(title: "Women"),
    CategoryFilterItem(title: "Men’s"),
    CategoryFilterItem(title: "Kids"),
    CategoryFilterItem(title: "Home & Living")
  ];
  double screenWidth, screenHeight;

  update(itemIndex) {
    setState(() {
      categoryFilterItems.forEach((element) {
        element.active = false;
      });
      categoryFilterItems[itemIndex].active = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: kMainBlockTopPadding,
            bottom: 0,
            left: scU.scale(kMainHorizPadding),
            right: scU.scale(kMainHorizPadding)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(scU.scale(kMainBlockRadius)),
              topRight: Radius.circular(scU.scale(kMainBlockRadius))),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: scU.scale(46),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryFilterItems.length,
                  itemBuilder: (BuildContext context, int itemIndex) {
                    CategoryFilterItem catFilItem =
                        categoryFilterItems[itemIndex];
                    return CategoryFilterItemComponent(
                      title: catFilItem.title,
                      active: catFilItem.active,
                      press: update,
                      itemIndex: itemIndex,
                    );
                  }),
            ),
            Expanded(
              child: FutureBuilder<List<CategoryItem>>(
                  future: fetchCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CategoryItem> data = snapshot.data;
                      return CategoriesListView(data: data);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Container(
                        alignment: Alignment.center,
                        width: scU.scale(60),
                        height: scU.scale(60),
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              kCircularProgressIndicatorColor),
                        ));
                  }),
            ),
          ],
        ));
  }
}
