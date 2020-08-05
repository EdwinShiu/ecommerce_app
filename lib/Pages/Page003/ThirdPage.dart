import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant.dart';
import '../../data/items.dart';

class ThirdPage extends StatefulWidget {
  @override
  ThirdPageState createState() => ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {
  

  @override
  Widget build(BuildContext context) {
    /*
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Favorite',
            style: GoogleFonts.ptSans(
              fontSize: 50.0,
              fontWeight: FontWeight.w500,
              color: sonyBlack,
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(12, 10, 12, 16),
            padding: EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Color.fromRGBO(210, 210, 210, 0.8),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget> [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                      height: 400,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            spreadRadius: -10,
                            blurRadius: 13,
                          ),
                        ]
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
    */
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Favorite',
            style: GoogleFonts.ptSans(
              fontSize: 50.0,
              fontWeight: FontWeight.w500,
              color: sonyBlack,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 200,
                color: Colors.yellow,
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}