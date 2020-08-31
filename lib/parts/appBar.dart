import 'package:ecommerce_app/data/routing.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant.dart';

Widget drawerAppbar(BuildContext context) {
  final RouteGenerator route = Provider.of<RouteGenerator>(context);
  final double defaultSize = SizeConfig.defaultSize;
  if (route.routeName == "/root") {
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
              size: defaultSize * 3,
            ),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ],
    );
  } 
  else {
    return AppBar(
      leading: FlatButton(
        onPressed: () {
          //print("pressed");
          route.toPrevious();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: defaultSize * 3,
        ),
      ),
      backgroundColor: sonyBlack,
      actions: <Widget>[
        Builder(
          builder: (context) => IconButton(
            iconSize: accountIconSize,
            alignment: Alignment.center,
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: defaultSize * 3,
            ),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ],
    );
  }
}
