import 'package:flutter/material.dart';
import '../Pages/Page002/itemPage.dart';
import '../main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainNavigationPage());
      case ItemPage.routeName:
        return MaterialPageRoute(builder: (_) => ItemPage());
      default:
        return _errorRoute();
    }
  }


  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      }
    );
  }
}