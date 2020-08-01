import 'package:ecommerce_app/Pages/Page002/ItemPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/items.dart';

Widget newItem(BuildContext context, int index) {
  const double borderRadius = 10.0;

  return Container(
    decoration: BoxDecoration(
      color: Color.fromRGBO(240, 240, 240, 1),
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          offset: Offset(0.0, 1.0),
          blurRadius: 11.0,
          spreadRadius: -11.0,
        ),
      ],
    ),
    height: 180.0,
    margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      child: Stack(  
        children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Image.asset(newItemImages[index]['imagePath'],
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(left: 12.0, top: 12.0),
                  child: Text(newItemImages[index]['itemName'],
                    style: GoogleFonts.ptSans(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3D66B9),
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            highlightColor: Color.fromRGBO(170, 170, 235, 0.3),
            onTap: () {
              print(ItemPage.routeName);
              Navigator.of(context).pushNamed(
                ItemPage.routeName,
                arguments: 'test',
              );
            },  
          ),
        ),
      ],
    ),
  );
}