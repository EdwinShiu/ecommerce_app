import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/items.dart';

Widget newItem(int index) {
  return Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Color.fromRGBO(240, 240, 240, 1),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          offset: Offset(0.0, 3.0),
          blurRadius: 11.0,
          spreadRadius: -10.0,
        ),
      ],
    ),
    height: 180.0,
    margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
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
  );
}