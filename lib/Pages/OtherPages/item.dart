import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/data/product.dart';
import 'package:flutter/cupertino.dart';

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
    product.selectedItem = null;
    return Container(
      child: Column(
        children: [
          Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          alignment: Alignment.bottomLeft,
          child: Text(
            items[0].title,
            style: GoogleFonts.ptSans(
              fontSize: 50.0,
              fontWeight: FontWeight.w500,
              color: sonyBlack,
            ),
          ),
        ),
        ],
      ),
    );
  }
}