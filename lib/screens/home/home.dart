import 'package:advika/screens/home/components/header.dart';
import 'package:advika/screens/home/components/main_content.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../main_drawer.dart';

class HomeScreen extends StatefulWidget {
  static final String path = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCollapsed;

  @override
  void initState() {
    super.initState();
    isCollapsed = true;
  }

  setStateFromChildWidget() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
            child: Container(
          width: size.width,
          child: Stack(
            children: <Widget>[
              MainDrawer(updateParent: setStateFromChildWidget),
              PageHome(
                isCollapsed: isCollapsed,
                updateParent: setStateFromChildWidget,
              )
            ],
          ),
        )));
  }
}

class PageHome extends StatefulWidget {
  final bool isCollapsed;
  final Function updateParent;
  PageHome({
    Key key,
    @required this.isCollapsed,
    @required this.updateParent,
  }) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final GlobalKey _pageHomeKey = GlobalKey();
  Offset pagePosition;
  Size pageSize;
  bool isCollapsed;

  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 250);

  getSizeAndPosition() {
    RenderBox _headerBox = _pageHomeKey.currentContext.findRenderObject();
    pageSize = _headerBox.size;
    pagePosition = _headerBox.localToGlobal(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    isCollapsed = widget.isCollapsed;
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return AnimatedPositioned(
      key: _pageHomeKey,
      duration: duration,
      top: isCollapsed ? 0 : 0,
      bottom: isCollapsed ? 0 : 0,
      left: isCollapsed ? 0 : 0.75 * screenWidth,
      right: isCollapsed ? 0 : -0.75 * screenWidth,
      child: AbsorbPointer(
        absorbing: !isCollapsed,
        child: Container(
            height: double.infinity,
            color: kMainBackgroundColor,
            child: Column(
              children: <Widget>[
                Header(
                    updateParent: widget.updateParent,
                    isCollapsed: isCollapsed),
                Expanded(child: MainContent())
              ],
            )),
      ),
    );
  }
}
