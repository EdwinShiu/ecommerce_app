import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/data/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Products product = Provider.of<Products>(context);
    final List<Item> items = product.selectedItem;
    if (items == null) {
      return Center(
        child: Text(
          "Error",
          style: GoogleFonts.ptSans(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: sonyBlack,
          ),
        ),
      );
    }
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
                          padding: EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            categoryString(items[0]),
                            style: GoogleFonts.ptSans(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            items[0].title,
                            style: GoogleFonts.ptSans(
                              fontSize: 50.0,
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
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                items[0].subtitle,
                                style: GoogleFonts.ptSans(
                                  fontSize: 24.0,
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
                          height: 50,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            "Price",
                            style: GoogleFonts.ptSans(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30, bottom: 10),
                          child: Text(
                            "HK\$ " + items[0].price,
                            style: GoogleFonts.ptSans(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 80.0,
                        ),
                      ],
                    ),
                    Positioned(
                      right: 10.0,
                      bottom: 20.0,
                      child: Container(
                        width: 250.0,
                        height: 250.0,
                        child: Image.asset(
                          items[0].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: descriptionList(items[0]),
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
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Stock: " + items[0].stock.toString(),
                            style: GoogleFonts.ptSans(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: sonyBlack,
                            ),
                          ),
                        ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Material(
                                elevation: 10,
                                color: sonyRed,
                                child: InkWell(
                                  onTap: () {
                                    print("Add to Cart");
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
                                    child: Text(
                                      "Add to Cart",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ptSans(
                                        fontSize: 24.0,
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
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 35.0
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.share,
                              color: Color.fromRGBO(150, 150, 150, 1),
                              size: 35.0
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

  List<Widget> descriptionList(Item item) {
    List<Widget> temp = [];
    for (final element in item.description) {
      temp.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " • ",
                style: GoogleFonts.ptSans(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: sonyBlack,
                ),
              ),
              Flexible(
                child: Text(
                  element,
                  style: GoogleFonts.ptSans(
                    fontSize: 20.0,
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