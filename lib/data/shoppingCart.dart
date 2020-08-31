import 'package:ecommerce_app/data/product.dart';
import 'package:flutter/material.dart';

class CartList extends ChangeNotifier {
  List<CartItem> cartList = [];

  CartList({List<CartItem> list}) {
    if (list != null) {
      for (final element in list) {
        this.cartList.add(element);
      }
    }
  }

  String total() {
    int total = 0;
    for (final element in cartList) {
      total += int.parse(element.item.price) * element.numberOfItem;
    }
    return total.toString();
  } 

  void addOne(int index) {
    if (cartList[index].numberOfItem < 10) {
      cartList[index].numberOfItem++;
    }
    notifyListeners();
  }

  void minusOne(int index) {
    if (cartList[index].numberOfItem > 1) {
      cartList[index].numberOfItem--;
      notifyListeners();
    }
    else {
      removeAt(index);
    }
  }

  void removeAt(int index) {
    cartList.removeAt(index);
    notifyListeners();
  }

  void addItem(Item item) {
    bool found = false;
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].item == item) {
        found = true;
        cartList[i].numberOfItem++;
      }
    }
    if (!found) {
      cartList.add(CartItem(item: item, numberOfItem: 1));
    }
    notifyListeners();
  }

  @override
  String toString() {
    String temp = "";
    for (final element in cartList) {
      temp += element.toString() + "\n";
    }
    return temp;
  }
}

class CartItem {
  Item item;
  int numberOfItem = 0;

  CartItem({this.item, this.numberOfItem});

  @override
  String toString() {
    return item.toString() + " " + numberOfItem.toString();
  }

}