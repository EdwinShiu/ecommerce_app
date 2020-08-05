import 'package:flutter/material.dart';
import '../constant.dart';

Widget drawerAppbar(BuildContext context) {
  return AppBar(
    leading: Container(),
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
}

Widget mainAppbar(BuildContext context) {
  return AppBar(
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
}
