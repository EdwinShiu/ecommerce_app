import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/data/items.dart';
import 'package:ecommerce_app/data/product.dart';
import 'package:ecommerce_app/data/selectedProducts.dart';
import 'package:ecommerce_app/data/shoppingCart.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NewItemPage extends StatefulWidget {

  final bool isFav; 

  NewItemPage(this.isFav);
  
  NewItemPageState createState() => NewItemPageState();
}

class NewItemPageState extends State<NewItemPage> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation _colorAnimation;

  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    if (widget.isFav) {
      _controller.animateTo(1, duration: Duration());
    }
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.key.toString());
    final double defaultSize = SizeConfig.defaultSize;
    final CartList cartList = Provider.of<CartList>(context);
    //print(cartList.toString());
    final ProductsPageNotifier selectedItemList = Provider.of<ProductsPageNotifier>(context);
    //print(selectedItemList.newItemItemList);
    final Item itemShowing = selectedItemList.newItemListselectedItem;
    final FavouriteNotifier favouriteList = Provider.of<FavouriteNotifier>(context);
    if (favouriteList.isInFav(selectedItemList.newItemItemList)) {
      _controller.animateTo(1, duration: Duration(milliseconds: 300));
    }
    else {
      _controller.animateTo(0, duration: Duration(milliseconds: 300));
    }
    if (itemShowing == null) {
      return Center(
        child: Text(
          "Error",
          style: TextStyle(
            fontSize: defaultSize * 2,
            fontWeight: FontWeight.w500,
            color: sonyBlack,
          ),
        ),
      );
    }
    else {
      return Container( 
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: sonyBlack,
                  alignment: Alignment.topLeft,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: defaultSize * 0.9, top: defaultSize * 0.4),
                            child: Text(
                              categoryString(itemShowing),
                              style: TextStyle(
                                fontSize: defaultSize * 1.3,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: defaultSize * 2.6),
                            child: Text(
                              itemShowing.title,
                              style: TextStyle(
                                fontSize: defaultSize * 4.3,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Padding(
                                padding: EdgeInsets.only(left: defaultSize * 2.6),
                                child: Text(
                                  itemShowing.subtitle,
                                  style: TextStyle(
                                    fontSize: defaultSize * 2,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(),
                              )
                            ],
                          ),
                          SizedBox(
                            height: defaultSize * 4.3,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: defaultSize * 3.4),
                            child: Text(
                              "Price",
                              style: TextStyle(
                                fontSize: defaultSize * 1.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: defaultSize * 2.6, bottom: defaultSize * 0.9),
                            child: Text(
                              "HK\$ " + itemShowing.price,
                              style: TextStyle(
                                fontSize: defaultSize * 2.4,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            height: defaultSize * 8,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.7),
                            color: Colors.white,
                            child: Row(
                              children: [
                                (selectedItemList.newItemItemList.item.length == 1) ? Container() : DropdownButton<Item>(
                                  isExpanded: false,
                                  value: itemShowing,
                                  style: TextStyle(
                                    fontSize: defaultSize * 1.7,
                                    fontWeight: FontWeight.w500,
                                    color: sonyBlack,
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: sonyBlack,
                                  ),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: defaultSize * 2,
                                  items: selectedItemList.newItemItemList.item.map((Item item) {
                                    return DropdownMenuItem(
                                      value: item,
                                      child: Text(item.subtitle),
                                    );
                                  }).toList(),
                                  onChanged: (Item newItem) {
                                    selectedItemList.setNewItemListSelectedItem = newItem;
                                  },
                                ),
                                Expanded(child: Material()),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: defaultSize * 0.9,
                        bottom: defaultSize * 1.7,
                        child: Container(
                          width: defaultSize * 21.7,
                          height: defaultSize * 21.7,
                          child: Image.asset(
                            itemShowing.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: descriptionList(itemShowing),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 245, 245, 1),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15.0,
                          offset: Offset(0, 10),
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: defaultSize * 0.9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: defaultSize * 1.7),
                            child: Text(
                              "Stock: " + itemShowing.stock.toString(),
                              style: TextStyle(
                                fontSize: defaultSize * 1.3,
                                fontWeight: FontWeight.w500,
                                color: sonyBlack,
                              ),
                            ),
                          ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.7),
                                child: Material(
                                  elevation: 10,
                                  color: sonyRed,
                                  child: InkWell(
                                    onTap: () {
                                      cartList.addItem(itemShowing);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: defaultSize, horizontal: defaultSize * 1.3),
                                      child: Text(
                                        "Add to Cart",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: defaultSize * 2,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: defaultSize * 1.7),
                              child: AnimatedBuilder(
                                animation: _controller,
                                builder: (context, _) {
                                  return IconButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      color: _colorAnimation.value,
                                      size: defaultSize * 3,
                                    ),
                                    onPressed: () {
                                      /*
                                      if (_controller.status == AnimationStatus.dismissed) {
                                        _controller.forward();
                                        print("forward");
                                        if (widget.isFav) {
                                          favouriteList.removeFavouriteItem(selectedItemList.newItemItemList);
                                        }
                                        else {
                                           favouriteList.addFavouriteItem(selectedItemList.newItemItemList);
                                        }
                                      }
                                      else {
                                        _controller.reverse();
                                        print("backward");
                                        if (widget.isFav) {
                                          favouriteList.removeFavouriteItem(selectedItemList.newItemItemList);
                                        }
                                        else {
                                           favouriteList.addFavouriteItem(selectedItemList.newItemItemList);
                                        }
                                      }
                                      */
                                      favouriteList.toggleFavouriteItem(selectedItemList.newItemItemList);
                                      //_controller.forward();
                                    },
                                  );
                                }
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: defaultSize * 1.7),
                              child: Icon(
                                Icons.share,
                                color: Color.fromRGBO(150, 150, 150, 1),
                                size: defaultSize * 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  List<Widget> descriptionList(Item item) {
    final defaultSize = SizeConfig.defaultSize;
    List<Widget> temp = [];
    for (final element in item.description) {
      temp.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.7, vertical: defaultSize * 0.4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " • ",
                style: TextStyle(
                  fontSize: defaultSize * 1.7,
                  fontWeight: FontWeight.w500,
                  color: sonyBlack,
                ),
              ),
              Flexible(
                child: Text(
                  element,
                  style: TextStyle(
                    fontSize: defaultSize * 1.7,
                    fontWeight: FontWeight.w500,
                    color: sonyBlack,
                  ),
                ),
              ),
            ]
          ),
        ),
      );
    }
    return temp;
  }

  String categoryString(Item item) {
    String temp = item.subCategory[0];
    for (int i = 1; i < item.subCategory.length; i++) {
      temp += " | " + item.subCategory[i];
    }
    return temp;
  }
}