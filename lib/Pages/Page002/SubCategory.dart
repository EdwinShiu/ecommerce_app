import 'package:ecommerce_app/data/category.dart';
import 'package:ecommerce_app/data/product.dart';
import 'package:ecommerce_app/data/routing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';

class SubCategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final RouteGenerator route = Provider.of<RouteGenerator>(context);
    final SubCategory subCategory = Provider.of<SubCategory>(context);
    final Products products = Provider.of<Products>(context);
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