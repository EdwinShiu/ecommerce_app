import 'package:ecommerce_app/authentication/auth.dart';
import 'package:ecommerce_app/data/category.dart';
import 'package:ecommerce_app/data/items.dart';
import 'package:ecommerce_app/data/product.dart';
import 'package:ecommerce_app/data/routing.dart';
import 'package:ecommerce_app/data/selectedProducts.dart';
import 'package:ecommerce_app/data/service/categoryDatabase.dart';
import 'package:ecommerce_app/data/service/productDatabase.dart';
import 'package:ecommerce_app/data/shoppingCart.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './constant.dart';
import 'package:provider/provider.dart';
import './authentication/auth.dart';
import './data/user.dart';
import './homePage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RouteGenerator>.value(
      value: RouteGenerator(),
      child: MaterialApp(
        title: appTitle, 
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.ptSansTextTheme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: MainNavigationPage(),
      ),
    );
  }
}

class MainNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print("main got rebuild");
    //return StreamBuilder<User>(
      //stream: AuthService().user,
      //builder: (context, snapshot) {
        //print("streamBuilder got rebuild");
        return StreamProvider<User>.value (
          value: AuthService().user,
          child: StreamProvider<BigCategoryList>(
            create: (_) => CategoryDatabase().categorySnapshot,
            child: StreamProvider<Products>(
              create: (_) => ProductDatabase().productSnapshot,
              child: ChangeNotifierProvider<ProductsPageNotifier>.value(
                value: ProductsPageNotifier(),
                child: ChangeNotifierProvider<CartList>.value(
                  value: CartList(),
                  child: ChangeNotifierProvider<FavouriteNotifier>.value(
                    value: FavouriteNotifier(),
                    child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (OverscrollIndicatorNotification overscroll) {
                        overscroll.disallowGlow();
                        return false;
                      },
                      child: HomePage(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      //},
    //);
  }
}
