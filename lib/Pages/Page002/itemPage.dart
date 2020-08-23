import 'package:ecommerce_app/data/items.dart';
import 'package:ecommerce_app/data/routing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';


class ItemPage extends StatefulWidget {
  static const routeName = '/itemPage';
  
  @override
  ItemPageState createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            //color: Colors.yellow,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Television',
              style: GoogleFonts.ptSans(
                fontSize: 50.0,
                fontWeight: FontWeight.w500,
                color: sonyBlack,
              ),
            ),
          ),
          Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              cacheExtent: 100.0,
              itemCount: newItemImages.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  color: Color.fromRGBO(240, 245, 255, 1),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                          newItemImages[index]['imagePath'],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                          ),
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            newItemImages[index]['itemName'],
                            style: GoogleFonts.ptSans(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          highlightColor: Color.fromRGBO(170, 170, 195, 0.3),
                          onTap: () {
                          },
                        )
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            //color: Colors.yellow,
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Television',
              style: GoogleFonts.ptSans(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: sonyBlack,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(),
          ),
        ],

      ),
    );
  }
}