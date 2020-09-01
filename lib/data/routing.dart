import 'package:flutter/material.dart';

class RouteGenerator extends ChangeNotifier {
  // change it to Stack
  List<List<String>> _routeList = [["/root"],
                                   ["/root"],
                                   ["/root"],
                                   ["/root"]];
  int _bottomNavBarIndex = 0;
  String _routeName = "/root";

  String get routeName => _routeName;

  String get routeName0 => _routeList[0].last;

  String get routeName1 => _routeList[1].last;

  String get routeName2 => _routeList[2].last;

  String get routeName3 => _routeList[3].last;

  int get bottomNavBarIndex =>_bottomNavBarIndex;

  set routeName(String val) {
    _routeName = val;
    notifyListeners();
  }

  set bottomNavBarIndex(int val) {
    _bottomNavBarIndex = val;
    print(_routeList);
    print(_bottomNavBarIndex);
    _routeName = _routeList[_bottomNavBarIndex].last;
    notifyListeners();
  }

  void toPrevious() {
    if (_routeList[_bottomNavBarIndex].last != "/root") {
      _routeList[_bottomNavBarIndex].removeLast();
    }
    routeName = _routeList[_bottomNavBarIndex].last;
  }

  void toRoot() {
    _routeList[_bottomNavBarIndex].clear();
    _routeList[_bottomNavBarIndex].add("/root");
    routeName = _routeList[_bottomNavBarIndex].last;
  }

  void toSubCategoryPage() {
    _routeList[_bottomNavBarIndex].add("/subCat");
    routeName = _routeList[_bottomNavBarIndex].last;
  }

  void toItemPage() {
    _routeList[_bottomNavBarIndex].add("/itemPage");
    routeName = _routeList[_bottomNavBarIndex].last;
  }
}