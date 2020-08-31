import 'package:ecommerce_app/data/shoppingCart.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant.dart';

Widget mainDrawer(BuildContext context) {
  final double defaultSize = SizeConfig.defaultSize;
  final CartList cartList = Provider.of<CartList>(context);
  return Drawer(
    child: Column(
      children: [
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
          padding: EdgeInsets.only(bottom: defaultSize * 0.3),
          alignment: Alignment.center,
          child: Text(
            " >>> Swipe to delete >>>"
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cartList.cartList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(cartList.cartList[index].item.title),
                direction: DismissDirection.startToEnd,
                child: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Image.asset(
                        cartList.cartList[index].item.image,
                        fit: BoxFit.fitHeight,
                      ),
                      SizedBox(width: defaultSize * 0.43),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartList.cartList[index].item.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: sonyBlack,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              cartList.cartList[index].item.subtitle,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: sonyBlack,
                                fontSize: 16,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Text(
                              "HK\$ " + cartList.cartList[index].item.price,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: sonyBlack,
                                fontSize: 24,
                              ),
                            ),
                            Container(
                              height: 30,
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonTheme(
                                    minWidth: 30,
                                    height: 30,
                                    buttonColor: Color.fromRGBO(235, 235, 235, 1),
                                    child: RaisedButton(
                                      child: Container(
                                        child: Text("-"),
                                      ),
                                      onPressed: () {
                                        cartList.minusOne(index);
                                      },
                                    ),
                                  ),
                                  Text(
                                    cartList.cartList[index].numberOfItem.toString(),
                                  ),
                                  ButtonTheme(
                                    minWidth: 30,
                                    height: 30,
                                    buttonColor: Color.fromRGBO(235, 235, 235, 1),
                                    child: RaisedButton(
                                      child: Container(
                                        child: Text("+"),
                                      ),
                                      onPressed: () {
                                        cartList.addOne(index);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
                background: Container(
                  color: sonyRed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: defaultSize),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                            Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onDismissed: (_) {
                  cartList.removeAt(index);
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}
