import 'package:flutter/material.dart';
import '../constant.dart';

Widget mainDrawer() {
  return Drawer(
    child: ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: sonyBlack,
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: accountIconSize,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 28.0,
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
  );
}
