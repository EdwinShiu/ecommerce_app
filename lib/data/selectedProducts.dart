import 'package:ecommerce_app/data/product.dart';
import 'package:flutter/material.dart';

class ProductsPageNotifier extends ChangeNotifier {
  final ItemListForShowing _newItemList = ItemListForShowing();
  final ItemListForShowing _itemList = ItemListForShowing();


  set setItemListSelectedItemList(List<Item> itemList) {
    _itemList.selectedItemList = itemList;
  }

  set setNewItemListSelectedItemList(List<Item> itemList) {
    _newItemList.selectedItemList = itemList;
  }

  List<Item> get itemListItemList => _itemList.selectedItemList;

  List<Item> get newItemItemList => _newItemList.selectedItemList;

  set setItemListSelectedItem(Item item) {
    _itemList.selectedItem = item;
    notifyListeners();
  }

  set setNewItemListSelectedItem(Item item) {
    _newItemList.selectedItem = item;
    notifyListeners();
  }

  Item get itemListselectedItem => _itemList.selectedItem;

  Item get newItemListselectedItem => _newItemList.selectedItem;
}

class ItemListForShowing {
  List<Item> selectedItemList;
  Item selectedItem;
}