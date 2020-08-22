import 'package:ecommerce_app/authentication/auth.dart';
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
    return MaterialApp(title: appTitle, routes: {
        '/': (context) => MainNavigationPage(),
      }
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
          child: HomePage(),
        );
      //},
    //);
  }
}
