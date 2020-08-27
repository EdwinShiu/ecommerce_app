import 'package:ecommerce_app/authentication/auth.dart';
import 'package:ecommerce_app/data/category.dart';
import 'package:ecommerce_app/data/product.dart';
import 'package:ecommerce_app/data/routing.dart';
import 'package:ecommerce_app/data/service/categoryDatabase.dart';
import 'package:ecommerce_app/data/service/productDatabase.dart';
import 'package:flutter/material.dart';
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
        debugShowCheckedModeBanner: false,
        home: MainNavigationPage(),
      ),
    );
  }
}

class MainNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              child: HomePage(),
            ),
          ),
        );
      //},
    //);
  }
}
