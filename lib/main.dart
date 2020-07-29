import 'package:flutter/material.dart';
import './constant.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  final double bottomNavigationBarHeight = 80.0;
  int _page = 0;
  final double accountIconSize = 40.0;

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
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Color.fromRGBO(138, 197, 255, 1),
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
              iconSize: accountIconSize,
              alignment: Alignment.center,
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
            ),           
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(138, 197, 255, 1),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(                 
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: accountIconSize,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                height: 70.0,
                child: ListTile(
                  title: Text('Tile 1'),
                  onTap: () {},
                ),
              ),
              Divider(
                height: 0,
                thickness: 1.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                height: 70.0,
                child: ListTile(
                  title: Text('Tile 2'),
                  onTap: () {},
                ),
              ),
              Divider(
                height: 0,
                thickness: 1.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                height: 70.0,
                child: ListTile(
                  title: Text('Tile 3'),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: bottomNavigationBarHeight,
          child: BottomNavigationBar(
            currentIndex: _page,
            onTap: (index) {
              _mainNavigationPageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
            },
            type: BottomNavigationBarType.shifting,
            //backgroundColor: Color(0xFFA8E3FF),
            items: <BottomNavigationBarItem> [
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(138, 197, 255, 1),
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                title: Text('Category'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Favourite'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text('Cart'),
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _mainNavigationPageController,
          onPageChanged: (newPage) {
            setState(() {
              _page = newPage;
            });
          },
          children: <Widget>[
            Center(
              child: Text('Page $_page'),
            ),
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
