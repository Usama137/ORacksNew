import 'package:advika/components/header.dart';
import 'package:advika/constants.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'components/brands_items_list_view.dart';
import 'components/colors.dart';
import 'components/footer.dart';
import 'components/range_slider.dart';
import 'components/sizes.dart';

class FilterScreen extends StatelessWidget {
  static final String path = "/product_filter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
            child: Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Header(
                      title: "Filter",
                    ),
                    Expanded(child: LayoutBuilder(
                      builder: (context, constraints) {
                        return MainBlock(
                            mainBlockMaxHeight: constraints.maxHeight);
                      },
                    )
                        //child:,
                        ),
                    FilterFooter(),
                  ],
                ))));
  }
}

class MainBlock extends StatefulWidget {
  final double mainBlockMaxHeight;
  MainBlock({Key key, @required this.mainBlockMaxHeight}) : super(key: key);
  @override
  _MainBlockState createState() => _MainBlockState();
}

class _MainBlockState extends State<MainBlock> {
  final GlobalKey _customFilterMainBlockKey = GlobalKey();

  double screenWidth, screenHeight;
  double mainBlockWidth;
  double mainBlockHeight;

  getSizeMainBlock() {
    RenderBox _renderBox =
        _customFilterMainBlockKey.currentContext.findRenderObject();
    mainBlockWidth = _renderBox.size.width;
    mainBlockHeight = _renderBox.size.height;
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
        key: _customFilterMainBlockKey,
        alignment: Alignment.topCenter,
        width: double.infinity,
        padding: EdgeInsets.only(
            top: scU.scale(kMainBlockTopPadding),
            bottom: scU.scale(34),
            left: scU.scale(kMainHorizPadding),
            right: scU.scale(kMainHorizPadding)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(scU.scale(kMainBlockRadius)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Price range".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: scU.scale(13),
                      fontWeight: FontWeight.w600)),
              RangeSliderComponent(),
              SizedBox(
                height: scU.scale(30),
              ),
              Text("Brands".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: scU.scale(13),
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: scU.scale(9),
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: widget.mainBlockMaxHeight * 0.31),
                  child: BrandsItemsListView()),
              SizedBox(
                height: scU.scale(39),
              ),
              ColorsComponent(),
              SizedBox(
                height: scU.scale(39),
              ),
              SizesComponent()
            ],
          ),
        ));
  }
}
