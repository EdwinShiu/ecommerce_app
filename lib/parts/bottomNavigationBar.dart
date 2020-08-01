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
      //backgroundColor: Color(0xFFA8E3FF),
      items: <BottomNavigationBarItem>[
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
  );
}
