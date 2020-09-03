import 'package:ecommerce_app/Pages/OtherPages/error.dart';
import 'package:ecommerce_app/Pages/Page003/favoritePage.dart';
import 'package:ecommerce_app/data/product.dart';
import 'package:ecommerce_app/data/routing.dart';
import 'package:ecommerce_app/data/selectedProducts.dart';
import 'package:ecommerce_app/data/user.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../data/items.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('ThirdPage rebuild');
    //var uid = Provider.of<User>(context);
    //print(uid?.uid);
    var userData = Provider.of<UserData>(context);
    final favouriteList = Provider.of<FavouriteNotifier>(context);
    final RouteGenerator route = Provider.of<RouteGenerator>(context);
    final ProductsPageNotifier selectedProduct = Provider.of<ProductsPageNotifier>(context);
    //print("userData " + userData.toString());
    //print(route.routeName2);
    if (route.routeName2 == "/root") {
      int favoriteItemNumber = favouriteList.getLength();
      if (userData != null) {
        favoriteItemNumber = userData.favorite.length;
      }
      final double defaultSize = SizeConfig.defaultSize;
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: defaultSize * 0.7, horizontal: defaultSize * 0.9),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Favorite',
              style: TextStyle(
                fontSize: defaultSize * 4.3,
                fontWeight: FontWeight.w500,
                color: sonyBlack,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: favoriteItemNumber,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                Item favItemWithIndex = favouriteList.getFavouriteList[index].item[0];
                return Container(
                  margin: EdgeInsets.all(defaultSize * 0.9),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Color.fromRGBO(230, 230, 230, 1),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: itemBackgroundColor,
                              child: Image.asset(
                                favItemWithIndex.image,
                                fit: BoxFit.fitHeight,
                              )
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(defaultSize * 0.6, defaultSize * 0.2, defaultSize * 0.6, 0),
                                    child: Text(
                                      favItemWithIndex.title,
                                      style: TextStyle(
                                        fontSize: defaultSize * 2.5,
                                        fontWeight: FontWeight.w500,
                                        color: sonyBlack,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(defaultSize * 0.6, defaultSize * 0.2, defaultSize * 0.6, 0),
                                    child: Text(
                                      categoryString(favItemWithIndex),
                                      style: TextStyle(
                                        fontSize: defaultSize * 1.5,
                                        fontWeight: FontWeight.w500,
                                        color: sonyBlack,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            (favouriteList.getFavouriteList[index].item.length == 1) ? Container() : Text(
                                              'From',
                                              style: TextStyle(
                                                fontSize: defaultSize * 1.5,
                                                fontWeight: FontWeight.w500,
                                                color: sonyBlack,
                                              ),
                                            ),
                                            Text(
                                              'HK\$ ' + favItemWithIndex.price,
                                              style: TextStyle(
                                                fontSize: defaultSize * 2.1,
                                                fontWeight: FontWeight.w500,
                                                color: sonyBlack,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          highlightColor: Color.fromRGBO(170, 170, 195, 0.3),                               
                          onTap: () {
                            selectedProduct.setFavListSelectedItemList = favouriteList.getFavouriteList[index];
                            selectedProduct.setFavListSelectedItem = favItemWithIndex;
                            route.toItemPage();
                          },
                        ),
                      ),
                      Positioned(
                        bottom: defaultSize * 0.3,
                        right: defaultSize * 0.3,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            highlightColor: Color.fromRGBO(170, 170, 195, 0.3),                               
                            child: Icon(
                              Icons.favorite,
                              size: defaultSize * 3,
                              color: Colors.red,
                            ),
                            onTap: () {
                              print("unfavourite");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
    else if (route.routeName2 == "/itemPage") {
      return FavItemPage(favouriteList.isInFav(selectedProduct?.favItemItemList));
    }
    else {
      return ErrorPage();
    }
  }

  String categoryString(Item item) {
    String temp = item.subCategory[0];
    for (int i = 1; i < item.subCategory.length; i++) {
      temp += " | " + item.subCategory[i];
    }
    return temp;
  }
}