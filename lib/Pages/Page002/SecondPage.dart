import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/data/category.dart';
import 'package:ecommerce_app/data/items.dart';
import 'package:ecommerce_app/data/routing.dart';
import 'package:ecommerce_app/data/service/CategoryDatabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant.dart';
import 'itemPage.dart';

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    final RouteGenerator route = Provider.of<RouteGenerator>(context);
    if (route.routeName == "/root") {
    return StreamProvider<BigCategoryList>.value(
      value: CategoryDatabase().categorySnapshot,
      child: Column(
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
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: ListView.builder(
              itemCount: categories.length, 
              itemBuilder: (context, listIndex) {
                final BigCategoryList data = Provider.of<BigCategoryList>(context);
                print(data.toString());
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
                    itemCount: categories[listIndex].length - 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, gridIndex) {
                      return Container(
                        color: itemBackgroundColor,
                        margin: EdgeInsets.all(5.0),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  categoryImage[listIndex][gridIndex]['imagePath'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                verticalDirection: VerticalDirection.up,
                                children: <Widget> [
                                  Flexible(
                                    child: Text(
                                      categoryImage[listIndex][gridIndex]['itemName'],
                                      style: GoogleFonts.ptSans(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w500,
                                        color: sonyBlack,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                highlightColor: Color.fromRGBO(170, 170, 195, 0.3),
                                onTap: () {
                                  route.toItemPage();
                                  //pageNavigatorKey.currentState.pushNamed('/newItem');
                                }
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
      ),
    );
    }
    else {
      return SubCatPage();
    }
  }
}
