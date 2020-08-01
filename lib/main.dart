import 'package:ecommerce_app/data/routing.dart';
import 'package:ecommerce_app/parts/bottomNavigationBar.dart';
import 'package:ecommerce_app/parts/drawer.dart';
import 'package:flutter/material.dart';
import './constant.dart';
import 'Pages/Page001/frontPage.dart';
import './parts/appBar.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
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
    return SafeArea(
      child: Scaffold(
        appBar: mainAppbar(context),
        endDrawer: mainDrawer(),
        bottomNavigationBar: mainBottomNavigationBar(_mainNavigationPageController, _page),
        body: PageView(
          controller: _mainNavigationPageController,
          onPageChanged: (newPage) {
            setState(() {
              _page = newPage;
            });
          },
          children: <Widget>[
            FrontPage(),
            Center(
              child: Text('Page $_page'),
            ),
            Center(
              child: Text('Page $_page'),
            ),
            Center(
              child: Text('Page $_page'),
            ),
          ],
        ),
      ),
    );
  }
}
