import 'package:flutter/material.dart';
import 'package:ecommerce_app/parts/bottomNavigationBar.dart';
import 'package:ecommerce_app/parts/drawer.dart';
import 'package:ecommerce_app/parts/loadingScreen.dart';
import 'package:ecommerce_app/Pages/Page001/frontPage.dart';
import 'package:ecommerce_app/Pages/Page004/FourthPage.dart';
import './parts/appBar.dart';
import 'Pages/Page002/SecondPage.dart';
import 'Pages/OtherPages/itemPage.dart';
import './Pages/Page003/ThirdPage.dart';
import './data/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'data/user.dart';
import './constant.dart';



class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  int _page = 0;
  PageController _mainNavigationPageController;

  @override
  void initState() {
    super.initState();
    print("hihi");
    _mainNavigationPageController = PageController();
  }

  @override
  void dispose() {
    _mainNavigationPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("HomePage rebuild");
    //var uidd = Provider.of<User>(context)?.uid;
    //print(uidd.toString());
    return Container(
      child: StreamBuilder<UserData>(
        stream: DataBaseService(uid: Provider.of<User>(context)?.uid).userSnapshot,
        builder: (context, snapshot) {
          //print("uidd " + uidd.toString());
          //print("stream " + DataBaseService(uid: uidd).userSnapshot.toString());
          //print("snapshot "+ snapshot.error.toString());
          print("Inner streamBuilder rebuild");
          //print("userData in streamBuilder " + snapshot.data.toString());
          return Provider<UserData>.value (
            value: snapshot.data,
            child: SafeArea(
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
                  child: Navigator(
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
                  ),
                )
              ),
            ),
          );
        }
      ),
    );
  }
}