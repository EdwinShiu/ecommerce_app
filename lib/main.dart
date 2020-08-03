import 'package:ecommerce_app/parts/bottomNavigationBar.dart';
import 'package:ecommerce_app/parts/drawer.dart';
import 'package:flutter/material.dart';
import './constant.dart';
import './parts/appBar.dart';
import 'Pages/Page002/SecondPage.dart';
import 'Pages/OtherPages/itemPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './Pages/Page001/newItem.dart';

// testing
void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: appTitle, routes: {
      '/': (context) => MainNavigationPage(),
    });
  }
}

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _page = 0;
  int _current = 0;
  List<int> list = [0, 1, 2, 3, 4];
  final List<String> bannerList = [
    'assets/images/WM1Z_banner.jpg',
    'assets/images/WM1A_banner.jpg',
    'assets/images/ZX500_banner.jpg',
    'assets/images/A100_banner.jpg',
    'assets/images/A50_banner.jpg'
  ];

  PageController _mainNavigationPageController;
  GlobalKey<NavigatorState> _pageNavigatorKey = GlobalKey<NavigatorState>();

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
        appBar: drawerAppbar(context),
        endDrawer: mainDrawer(),
        bottomNavigationBar: mainBottomNavigationBar(
            context, _mainNavigationPageController, _page),
        body: Navigator(
            key: _pageNavigatorKey,
            onGenerateRoute: (settings) {
              if (settings.name == '/newItem') {
                return MaterialPageRoute(
                  builder: (context) => ItemPage(),
                );
              }
              print(settings.name);
              return MaterialPageRoute(
                  builder: (context) => PageView(
                        controller: _mainNavigationPageController,
                        onPageChanged: (newPage) {
                          setState(() {
                            _page = newPage;
                          });
                        },
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 25.0),
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                      height: 250.0,
                                      viewportFraction: 1,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 15),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      autoPlayAnimationDuration:
                                          Duration(seconds: 3),
                                      onPageChanged: (index, _) {
                                        setState(() {
                                          _current = index;
                                        });
                                      }),
                                  items: list
                                      .map((item) => Container(
                                            constraints:
                                                BoxConstraints.expand(),
                                            child: Image.asset(
                                              bannerList[item],
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: bannerList.map((url) {
                                    int index = bannerList.indexOf(url);
                                    return Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: EdgeInsets.only(
                                          top: 6.0, left: 2.0, right: 2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _current == index
                                            ? Color.fromRGBO(0, 0, 0, 0.9)
                                            : Color.fromRGBO(0, 0, 0, 0.4),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'New',
                                  style: GoogleFonts.ptSans(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.w500,
                                    color: sonyBlack,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  children: <Widget>[
                                    newItem(context, _pageNavigatorKey, 0),
                                    newItem(context, _pageNavigatorKey, 1),
                                    newItem(context, _pageNavigatorKey, 2),
                                    newItem(context, _pageNavigatorKey, 3),
                                    newItem(context, _pageNavigatorKey, 4),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SecondPage(),
                          Center(
                            child: Text('Page $_page'),
                          ),
                          Center(
                            child: Text('Page $_page'),
                          ),
                        ],
                      ));
            }),
      ),
    );
  }
}
