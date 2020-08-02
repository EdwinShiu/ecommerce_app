import 'package:flutter/material.dart';
import '../constant.dart';

Widget mainBottomNavigationBar(
  PageController _mainNavigationPageController, int _page) {
  
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 13.0),
          blurRadius: 15.0,
          spreadRadius: 5.0,
        ),
      ],
    ),
    height: bottomNavigationBarHeight,
    child: BottomNavigationBar(
      currentIndex: _page,
      onTap: (index) {
        _mainNavigationPageController.animateToPage(index,
            duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      },
      type: BottomNavigationBarType.shifting,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: sonyBlack,
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          backgroundColor: sonyBlack,
          icon: Icon(Icons.apps),
          title: Text('Category'),
        ),
        BottomNavigationBarItem(
          backgroundColor: sonyBlack,
          icon: Icon(Icons.favorite),
          title: Text('Favourite'),
        ),
        BottomNavigationBarItem(
          backgroundColor: sonyBlack,
          icon: Icon(Icons.shopping_cart),
          title: Text('Cart'),
        ),
      ],
    ),
  );
}
