import 'package:advika/screens/congratulation/congratulation.dart';
import 'package:advika/screens/filter/filter.dart';
import 'package:advika/screens/home/home.dart';
import 'package:advika/screens/login_signup/login.dart';
import 'package:advika/screens/login_signup/signup.dart';
import 'package:advika/screens/payment/payment.dart';
import 'package:advika/screens/shipping_to/shipping_to.dart';
import 'package:advika/screens/splash/splash.dart';
import 'package:advika/screens/walkthrough/walkthrough.dart';
import 'package:advika/screens/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'screens/cart/cart.dart';
import 'screens/categories/categories.dart';
import 'screens/my_account/my_account.dart';
import 'screens/products/products.dart';
import 'screens/product_detail/product_detail.dart';

void main() => runApp(MyApp());
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return new MaterialApp(
      builder: (context, child) {
        final MediaQueryData data  = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: data.textScaleFactor > 1.15 ? 1.15 : data.textScaleFactor,
          ),
            child: child
        );
      },
        title: 'advika',
        navigatorObservers: [routeObserver],
        theme: ThemeData(
          fontFamily: 'Montserrat',
          accentColor: kImageDefaultBackgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.path,
        routes: {
          LoginScreen.path: (context) => LoginScreen(),
          SignupScreen.path: (context) => SignupScreen(),
          HomeScreen.path: (context) => HomeScreen(),
          CartScreen.path: (context) => CartScreen(),
          CategoriesScreen.path: (context) => CategoriesScreen(),
          ProductsScreen.path: (context) => ProductsScreen(),
          WalkthroughScreen.path: (context) => WalkthroughScreen(),
          ProductDetailScreen.path: (context) => ProductDetailScreen(),
          MyAccountScreen.path: (context) => MyAccountScreen(),
          ShippingToScreen.path: (context) => ShippingToScreen(),
          FilterScreen.path: (context) => FilterScreen(),
          PaymentScreen.path: (context) => PaymentScreen(),
          SplashScreen.path: (context) => SplashScreen(),
          CongratulationScreen.path: (context) => CongratulationScreen(),
          WishListScreen.path: (context) => WishListScreen(),
        });
  }
}
