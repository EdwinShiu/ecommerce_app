import 'package:ecommerce_app/data/category.dart';
import 'package:ecommerce_app/data/product.dart';
import 'package:ecommerce_app/data/routing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';

class SubCategoryPage extends StatelessWidget {

  List<List<Item>> _itemListOfSubCategory(String subCategoryName, List<CategoryProduct> productList, String bigCategoryName) {
    print(subCategoryName + " " + bigCategoryName);
    int i = 0;
    bool found = false;
    List<List<Item>> result = [];
    while (i < productList.length && !found) {
      if (productList[i].category == bigCategoryName) {
        for (final itemList in productList[i].itemList) {
          int j = 0;
          bool inSubCategory = false;
          while (j < itemList.item[0].subCategory.length && !inSubCategory) {
            if (subCategoryName == itemList.item[0].subCategory[j]) {
              result.add(itemList.item);
              inSubCategory = true;
            }
            j++; 
          }
        }
        found = true;
      }
      i++;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final String bigCategoryName = Provider.of<BigCategoryList>(context).bigCategoryName;
    final RouteGenerator route = Provider.of<RouteGenerator>(context);
    final SubCategory subCategory = Provider.of<SubCategory>(context);
    final Products products = Provider.of<Products>(context);
    List<List<Item>> itemList = _itemListOfSubCategory(subCategory.name, products.products, bigCategoryName);
    print(itemList.length);
    //print(subCategory.toString());
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          alignment: Alignment.bottomLeft,
          child: Text(
            subCategory.name,
            style: GoogleFonts.ptSans(
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
              color: sonyBlack,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: RaisedButton(
            onPressed: () {
              route.toItemPage();
            } 
          ),
          //ListView(),
        ),
      ]
    );
  }
}