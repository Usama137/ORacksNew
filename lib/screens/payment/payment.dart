import 'package:advika/components/header.dart';
import 'package:advika/components/rounded_button.dart';
import 'package:advika/screens/congratulation/congratulation.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../constants.dart';
import 'components/bank_card_slider.dart';
import 'components/text_row.dart';

class PaymentScreen extends StatelessWidget {
  static final String path = "/payment";
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    double bankCardHeight = 167;
    double sliderPaddingTop = 10;
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Header(
                  title: 'Payment',
                ),
                Expanded(child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      child: Stack(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: scU.scale(sliderPaddingTop)),
                              child: BankCardSlider(
                                  bankCardHeight: bankCardHeight)),
                          SizedBox(
                              child: _MainBlock(
                                  parentConstraints: constraints,
                                  bankCardHeight: bankCardHeight,
                                  sliderPaddingTop: sliderPaddingTop))
                        ],
                      ),
                    );
                  },
                )),
              ],
            ),
          ),
        ));
  }
}

class _MainBlock extends StatefulWidget {
  final BoxConstraints parentConstraints;
  final double bankCardHeight;
  final double sliderPaddingTop;

  @override
  _MainBlockState createState() => _MainBlockState();

  _MainBlock(
      {Key key,
      @required this.parentConstraints,
      @required this.bankCardHeight,
      @required this.sliderPaddingTop})
      : super(key: key);
}

class _MainBlockState extends State<_MainBlock> {
  double paddingBetweenTextRows;
  @override
  void initState() {
    super.initState();
    paddingBetweenTextRows = 9.0;
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    double paddingBetweenTextRowsScaled = scU.scale(paddingBetweenTextRows);
    double initialVal = 1 -
        ( scU.scale((widget.bankCardHeight + 31 + widget.sliderPaddingTop),) /
            widget.parentConstraints.maxHeight);
    return DraggableScrollableSheet(
        maxChildSize: 1 - ((1 - initialVal) / 2.5),
        initialChildSize: initialVal,
        minChildSize: initialVal,
        builder: (context, scrollController) {
          return Container(
              alignment: Alignment.topLeft,

              width: double.infinity,
              constraints: BoxConstraints(),
              padding: EdgeInsets.only(
                  top: scU.scale(kMainBlockTopPadding),
                  bottom: scU.scale(16),
                  left: scU.scale(kMainHorizPadding),
                  right: scU.scale(kMainHorizPadding)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(scU.scale(kMainBlockRadius)),
                    topRight: Radius.circular(scU.scale(kMainBlockRadius))),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 0),
                    Padding(
                      padding: EdgeInsets.only(
                          top: paddingBetweenTextRowsScaled,
                          bottom: paddingBetweenTextRowsScaled),
                      child: TextRowComponent(title: "Subtotal", value: "\$24"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: paddingBetweenTextRowsScaled,
                          bottom: paddingBetweenTextRowsScaled),
                      child: TextRowComponent(title: "Discount", value: "10%"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: paddingBetweenTextRowsScaled,
                          bottom: paddingBetweenTextRowsScaled),
                      child: TextRowComponent(title: "Shipping", value: "\$10"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: paddingBetweenTextRowsScaled,
                          bottom: paddingBetweenTextRowsScaled),
                      child: TextRowComponent(title: "Estimated Tax", value: "\$10"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: scU.scale(14)),
                      decoration: BoxDecoration(
                        border: Border.all(
                           // vertical: BorderSide(
                          color: Color.fromRGBO(223, 223, 223, 1),
                      //  )
                      ),
                      ),
                      padding: EdgeInsets.only(top: scU.scale(13), bottom: scU.scale(13)),
                      child: TextRowComponent(
                          title: "Subtotal", value: "\$10", bold: true),
                    ),
                    SizedBox(
                      height: scU.scale(30),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CongratulationScreen.path);
                      },
                      child: RoundedButton(
                        title: "Chekout",
                        buttonHeight: scU.scale(45),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
