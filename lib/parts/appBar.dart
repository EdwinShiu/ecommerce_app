import 'package:ecommerce_app/data/routing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant.dart';

Widget drawerAppbar(BuildContext context) {
  final String routeName = Provider.of<RouteGenerator>(context).routeName;
  if (routeName == "/home") {
    return backAppBar;
  }
  else {
    return mainAppBar;
  }
}

final mainAppBar = AppBar(
                    backgroundColor: sonyBlack,
                    actions: <Widget>[
                      Builder(
                        builder: (context) => IconButton(
                          iconSize: accountIconSize,
                          alignment: Alignment.center,
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        ),
                      ),
                    ],
                  );

final backAppBar = AppBar(
                    leading: Container(color: Colors.yellow),
                    backgroundColor: sonyBlack,
                    actions: <Widget>[
                      Builder(
                        builder: (context) => IconButton(
                          iconSize: accountIconSize,
                          alignment: Alignment.center,
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        ),
                      ),
                    ],
                  );
