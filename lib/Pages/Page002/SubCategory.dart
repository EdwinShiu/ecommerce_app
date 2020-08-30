import 'package:ecommerce_app/data/category.dart';
import 'package:ecommerce_app/data/product.dart';
import 'package:ecommerce_app/data/routing.dart';
import 'package:ecommerce_app/data/selectedProducts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import 'dart:math';

class SubCategoryPage extends StatelessWidget {

  List<List<Item>> _itemListOfSubCategory(String subCategoryName, List<CategoryProduct> productList, String bigCategoryName) {
    //print(subCategoryName + " " + bigCategoryName);
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

  List<Widget> descriptionList(List<String> descriptionList, String name) {
    List<Widget> textList = [
      Text(
        name,
        style: GoogleFonts.ptSans(
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
          color: sonyBlack,
        ),
      ),
    ];
    if (descriptionList.length > 0) {
      for(int index = 0; index < min(2, descriptionList.length); index++) {
        textList.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  " • ",
                  style: GoogleFonts.ptSans(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7F797D),
                  ),
                ),
              Flexible(
                child: Text(
                  descriptionList[index],
                  style: GoogleFonts.ptSans(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7F797D),
                  ),
                )
              )
            ]
          ),
        );
      }
    }
    return textList;
  }

  @override
  Widget build(BuildContext context) {
    final String bigCategoryName = Provider.of<BigCategoryList>(context).bigCategoryName;
    final RouteGenerator route = Provider.of<RouteGenerator>(context);
    final ProductsPageNotifier selectedProduct = Provider.of<ProductsPageNotifier>(context);
    final SubCategory subCategory = Provider.of<SubCategory>(context);
    final Products products = Provider.of<Products>(context);
    List<List<Item>> itemList = _itemListOfSubCategory(subCategory.name, products.products, bigCategoryName);
    //print(itemList.length);
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
        (itemList.length == 0) ? 
        Expanded(
          child: Center(
            child: Text(
              "No Product",
              style: GoogleFonts.ptSans(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: sonyBlack,
              ),
            ),
          )
        ) :
        Expanded(
          child: ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              var item = itemList[index][0];
              return Container(
                decoration: BoxDecoration(        
                  border: Border.all(
                    width: 1.0,
                    color: Color.fromRGBO(230, 230, 230, 1),
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),   
                height: 180.0,
                child: Stack(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: itemBackgroundColor,
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Stack(
                            children: <Widget> [
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: descriptionList(item.description, item.title),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Text(
                        (itemList[index].length == 1) ? "HK\$ " + item.price : "From HK\$ " + item.price,
                        style: GoogleFonts.ptSans(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          color: sonyBlack,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: Color.fromRGBO(170, 170, 195, 0.3),
                        onTap: () {
                          selectedProduct.setSelectedItemList = itemList[index];
                          selectedProduct.setSelectedItem = itemList[index][0];
                          route.toItemPage();
                        },              
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ]
    );
  }
}