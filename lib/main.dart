import 'package:ecommerce_app/Pages/Page001/frontPage.dart';
import 'package:ecommerce_app/Pages/Page004/FourthPage.dart';
import 'package:ecommerce_app/authentication/auth.dart';
import 'package:ecommerce_app/parts/bottomNavigationBar.dart';
import 'package:ecommerce_app/parts/drawer.dart';
import 'package:flutter/material.dart';
import './constant.dart';
import './parts/appBar.dart';
import 'Pages/Page002/SecondPage.dart';
import 'Pages/OtherPages/itemPage.dart';
import './Pages/Page003/ThirdPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import './authentication/auth.dart';
import './data/user.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(title: appTitle, routes: {
        '/': (context) => MainNavigationPage(),
      }),
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
        resizeToAvoidBottomInset: false,
        appBar: drawerAppbar(context),
        endDrawer: mainDrawer(),
        bottomNavigationBar: mainBottomNavigationBar(context, pageNavigatorKey, _mainNavigationPageController, _page),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child:  StreamBuilder(
            stream: Firestore.instance.collection('E-commerce User').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return Navigator(
                key: pageNavigatorKey,
                onGenerateRoute: (settings) {
                  if (settings.name == '/newItem') {
                    return MaterialPageRoute(
                      builder: (context) => ItemPage(),
                    );
                  }
                  return MaterialPageRoute(
                    builder: (context) => PageView(
                      controller: _mainNavigationPageController,
                      onPageChanged: (newPage) {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          _page = newPage;
                        });
                      },
                      children: <Widget>[
                        FrontPage(),
                        SecondPage(),
                        ThirdPage(),
                        FourthPage(),
                      ],
                    )
                  );
                }
              );
            },
          ),
        ),
      ),
    );
  }
}
