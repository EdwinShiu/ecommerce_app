import 'package:ecommerce_app/data/product.dart';
import 'package:ecommerce_app/data/routing.dart';
import 'package:ecommerce_app/data/selectedProducts.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import 'dart:math';

class NewItem extends StatelessWidget {
  final List<List<Item>> newItemList;

  NewItem(this.newItemList);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    final RouteGenerator route = Provider.of<RouteGenerator>(context);
    final ProductsPageNotifier selectedProduct = Provider.of<ProductsPageNotifier>(context);
    return ListView.builder(
      itemCount: newItemList.length,
      itemBuilder: (context, index) {
        Item item = newItemList[index][0];
        return Container(
          decoration: BoxDecoration(        
            border: Border.all(
              width: 1.0,
              color: Color.fromRGBO(230, 230, 230, 1),
            ),
          ),
          margin: EdgeInsets.symmetric(vertical: defaultSize * 0.5, horizontal: defaultSize),   
          height: defaultSize * 15.6,
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
                          padding: EdgeInsets.all(defaultSize * 0.4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: descriptionList(item),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: defaultSize * 0.4,
                right: defaultSize * 0.4,
                child: Text(
                  "HK\$ " + item.price.toString(),
                  style: TextStyle(
                    fontSize: defaultSize * 2,
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
                    //print("hihi");
                    selectedProduct.setNewItemListSelectedItemList = newItemList[index];
                    //print(selectedProduct.newItemItemList);
                    selectedProduct.setNewItemListSelectedItem = newItemList[index][0];
                    //print(selectedProduct.newItemListselectedItem);
                    route.toItemPage();
                  },              
                ),
              ),
              Positioned(
                bottom: defaultSize * 0.4,
                left: defaultSize * 0.3,
                child: Icon(
                Icons.favorite,
                  color: Colors.red,
                  size: defaultSize * 2.4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> descriptionList(Item item) {
    double defaultSize = SizeConfig.defaultSize;
    List<String> descriptionList = item.description;
    List<Widget> textList = [
      Text(
        item.title,
        style: TextStyle(
          fontSize: defaultSize * 2.1,
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
                  style: TextStyle(
                    fontSize: defaultSize * 1.4,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7F797D),
                  ),
                ),
              Flexible(
                child: Text(
                  descriptionList[index],
                  style: TextStyle(
                    fontSize: defaultSize * 1.4,
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
}
