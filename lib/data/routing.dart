import 'package:flutter/material.dart';

class RouteGenerator extends ChangeNotifier {
  // change it to Stack
  List<String> _previousList = ["/root", "/root", "/root", "/root"];
  int _bottomNavBarIndex = 0;
  String _routeName = "/root";

  String get routeName => _routeName;

  

  set routeName(String val) {
    _routeName = val;
    notifyListeners();
  }

  void toPrevious() {
  }

  void toRoot() {
    _previousList[_bottomNavBarIndex] = "/root";
    routeName = "/root";
  }

  void toSubCategoryPage() {
    _previousList[_bottomNavBarIndex] = "/root";
    routeName = "/subCategory";
  }

  void toItemPage() {

    routeName = "/itemPage";
  }
}