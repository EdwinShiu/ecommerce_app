import 'package:ecommerce_app/data/product.dart';
import 'package:flutter/material.dart';

class ProductsPageNotifier extends ChangeNotifier {
  List<Item> _selectedItemList;
  Item _selectedItem;

  set setSelectedItemList(List<Item> itemList) {
    _selectedItemList = itemList;
  }

  List<Item> get selectedItemList => _selectedItemList;

  set setSelectedItem(Item item) {
    _selectedItem = item;
    notifyListeners();
  }
  Item get selectedItem => _selectedItem;
}
