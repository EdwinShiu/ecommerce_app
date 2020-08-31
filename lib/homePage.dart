import 'package:flutter/material.dart';
import 'package:ecommerce_app/parts/bottomNavigationBar.dart';
import 'package:ecommerce_app/parts/drawer.dart';
import 'package:ecommerce_app/Pages/Page001/frontPage.dart';
import 'package:ecommerce_app/Pages/Page004/FourthPage.dart';
import './parts/appBar.dart';
import 'Pages/Page002/SecondPage.dart';
import './Pages/Page003/ThirdPage.dart';
import './data/service/database.dart';
import 'package:provider/provider.dart';
import 'data/routing.dart';
import 'data/user.dart';
import './constant.dart';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
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
    final RouteGenerator route = Provider.of<RouteGenerator>(context);
    print("HomePage rebuild");
    var uid = Provider.of<User>(context)?.uid;
    //print(uidd.toString());
    return Container(
      child: StreamBuilder<UserData>(
        stream: DataBaseService(uid: uid).userSnapshot,
        builder: (context, snapshot) {
          //print(Provider.of<User>(context)?.uid.toString());
          //print("stream " + DataBaseService(uid: uidd).userSnapshot.toString());
          //print("snapshot "+ snapshot.error.toString());
          // try to use provider to put ssnapshot data to the pages
          print("Inner streamBuilder ${snapshot.connectionState}");
          print("Inner streamBuilder rebuild");
          //print("userData in streamBuilder " + snapshot.data.toString());
          return Provider<UserData>.value (
            value: (uid != null) ? snapshot.data : null,
            child: SafeArea(
              child: Scaffold(
                key: drawerKey,
                resizeToAvoidBottomInset: false,
                appBar: drawerAppbar(context),
                endDrawer: mainDrawer(context),
                bottomNavigationBar: mainBottomNavigationBar(context, _mainNavigationPageController, route.bottomNavBarIndex),
                body: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  // use provider to replace navigator
                  child: PageView(
                    controller: _mainNavigationPageController,
                    allowImplicitScrolling: true,
                    onPageChanged: (newPage) {
                      FocusScope.of(context).unfocus();
                      route.bottomNavBarIndex = newPage;
                    },
                    children: <Widget>[
                      FrontPage(),
                      SecondPage(),
                      ThirdPage(),
                      FourthPage(),
                    ],
                  )
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}