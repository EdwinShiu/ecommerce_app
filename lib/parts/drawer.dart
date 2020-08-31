import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

Widget mainDrawer() {
  final double defaultSize = SizeConfig.defaultSize;
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
                    margin: EdgeInsets.only(right: defaultSize * 0.7),
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
                      fontSize: defaultSize * 2.4,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultSize * 0.3),
          height: defaultSize * 6,
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
          height: defaultSize * 6,
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
          height: defaultSize * 6,
          child: ListTile(
            title: Text('Tile 3'),
            onTap: () {},
          ),
        ),
      ],
    ),
  );
}
