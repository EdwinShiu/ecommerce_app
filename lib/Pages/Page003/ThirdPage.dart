import 'package:ecommerce_app/data/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../data/items.dart';

class ThirdPage extends StatefulWidget {
  @override
  ThirdPageState createState() => ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {
  

  @override
  Widget build(BuildContext context) {

    //final userInfo = Provider.of<UserInformation>(context);

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
            itemCount: favorite_item_number,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Color.fromRGBO(230, 230, 230, 1),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            color: itemBackgroundColor,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              highlightColor: Color.fromRGBO(170, 170, 195, 0.3),
                              onTap: () {
                                // TODO: Hero to itemPage
                              },
                            )
                          ),     
                          Positioned(
                            bottom: 3,
                            left: 3,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                highlightColor: Color.fromRGBO(170, 170, 195, 0.3),                               
                                child: Icon(
                                  Icons.favorite,
                                  size: 32,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                    // TODO: Data management
                                    if (favorite_item_number > 0) {
                                      favorite_item_number--;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                highlightColor: Color.fromRGBO(170, 170, 195, 0.3),                               
                                onTap: () {
                                  // TODO: Hero to ItemPage
                                },
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(7, 3, 7, 10),
                                      child: Text(
                                        'Testing Testing Testing Testing Testing',
                                        style: GoogleFonts.ptSans(
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.w500,
                                          color: sonyBlack,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(7, 3, 7, 10),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
                                          child: Text(
                                            'HK\$ XX,XXX',
                                            style: GoogleFonts.ptSans(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w500,
                                              color: sonyBlack,
                                            ),
                                          ),
                                        ),
                                      ),                                   
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}