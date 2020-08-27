import 'package:ecommerce_app/Pages/OtherPages/error.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_app/data/category.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import 'SubCategory.dart';


class SubCatPage extends StatefulWidget {  
  @override
  SubCatPageState createState() => SubCatPageState();
}

class SubCatPageState extends State<SubCatPage> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    final List<SubCategory> subCategoryList = Provider.of<List<SubCategory>>(context);
    //print(subCategoryList.toString());
    if (subCategoryList == null) {
      return ErrorPage();
    }
    return Provider<SubCategory>.value(
      value: subCategoryList[selected], 
      child: Container(
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
                itemCount: subCategoryList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    color: (index == selected)? Color.fromRGBO(210, 215, 225, 1) : Color.fromRGBO(240, 245, 255, 1),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            "assets/images/WM1Z_walkman.jpg",
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
                              subCategoryList[index].name,
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
                              setState(() {
                                selected = index;
                              });
                            },
                          )
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: SubCategoryPage(),
            )
          ],
        ),
      ),
    );
  }
}