import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/data/items.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant.dart';

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Category',
            style: GoogleFonts.ptSans(
              fontSize: 50.0,
              fontWeight: FontWeight.w500,
              color: sonyBlack,
            ),
          ),
        ),
        Divider(
          color: Color(0xFF2D4678),
          height: 0.0,
          thickness: 2,
          indent: 10.0,
          endIndent: 10.0,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            child: ListView.builder(
              itemCount: categories.length, 
              itemBuilder: (context, listIndex) {
                return StickyHeader(
                  header: Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 50.0,
                    color: sonyRed,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      categories[listIndex][0],
                      style: GoogleFonts.ptSans(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  content: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: categories[listIndex].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, gridIndex) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadius),
                          color: itemBackgroundColor,
                        ),
                        margin: EdgeInsets.all(5.0),
                        
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
