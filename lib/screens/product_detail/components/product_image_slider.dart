import 'package:advika/components/slide_indicators.dart';
import 'package:advika/models/product.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  ProductImageSlider({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImageSliderState createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  PageController slideController;
  int currentSlidePosition = 0;
  List<String> productImages;
  @override
  void initState() {
    super.initState();
    productImages = [
      widget.product.thumbUrl,
      widget.product.thumbUrl,
      widget.product.thumbUrl
    ];
    slideController = PageController(initialPage: 0);
  }

  updateState(int pos) {
    currentSlidePosition = pos;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                  onPageChanged: (int pos) {
                    updateState(pos);
                  },
                  controller: slideController,
                  itemCount: productImages.length,
                  itemBuilder: (context, position) {

                    return Image.network(widget.product.thumbUrl,
                        fit: BoxFit.fitHeight, width: double.infinity);
                  }),
            ),
            SizedBox(
              height: scU.scale(36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SlideIndocatorsComponent(
                      amountOfSlides: 3,
                      currentIndex: currentSlidePosition,
                      itemMarginRight: scU.scale(4),
                      sizeInactive: scU.scale(4),
                      sizeActive: scU.scale(13)),
                ],
              ),
            ),
          ],
        ));
  }
}
