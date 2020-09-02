import 'package:ecommerce_app/data/product.dart';
import 'package:flutter/material.dart';

class ProductsPageNotifier extends ChangeNotifier {
  final ItemListForShowing _newItemList = ItemListForShowing();
  final ItemListForShowing _itemList = ItemListForShowing();


  set setItemListSelectedItemList(ItemList itemList) {
    _itemList.selectedItemList = itemList;
  }

  set setNewItemListSelectedItemList(ItemList itemList) {
    _newItemList.selectedItemList = itemList;
  }

  ItemList get itemListItemList => _itemList.selectedItemList;

  ItemList get newItemItemList => _newItemList.selectedItemList;

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
  ItemList selectedItemList;
  Item selectedItem;
}