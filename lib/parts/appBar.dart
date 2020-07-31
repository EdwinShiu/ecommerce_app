import 'package:flutter/material.dart';
import '../constant.dart';

Widget mainAppbar(BuildContext context) {
  return AppBar(
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
  );
}
