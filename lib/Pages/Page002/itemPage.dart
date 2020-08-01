import 'package:flutter/material.dart';
import '../../parts/appBar.dart';
import '../../parts/bottomNavigationBar.dart';
import '../../parts/drawer.dart';

class ItemPage extends StatefulWidget {
  static const routeName = '/itemPage';
  
  @override
  ItemPageState createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {
  int _page = 0;

  PageController _mainNavigationPageController;
  
  @override
  void initState() {
    super.initState();
    _mainNavigationPageController = PageController();
  }

  @override
  void dispose() {
    _mainNavigationPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('hihi');
    return SafeArea(
      child: Scaffold(
        appBar: mainAppbar(context),
        endDrawer: mainDrawer(),
        body: Container(
          color: Colors.yellow,
        ),
        bottomNavigationBar: mainBottomNavigationBar(_mainNavigationPageController, _page),
      ),
    );
  }
}