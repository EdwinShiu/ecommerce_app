import 'package:ecommerce_app/Pages/OtherPages/error.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
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
    final double defaultSize = SizeConfig.defaultSize;
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
              padding: EdgeInsets.symmetric(vertical: defaultSize * 0.7, horizontal: defaultSize * 0.8),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Television',
                style: TextStyle(
                  fontSize: defaultSize * 4.3,
                  fontWeight: FontWeight.w500,
                  color: sonyBlack,
                ),
              ),
            ),
            Container(
              height: defaultSize * 13,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                cacheExtent: defaultSize * 9,
                itemCount: subCategoryList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: defaultSize * 17.4,
                    color: (index == selected)? Color.fromRGBO(210, 215, 225, 1) : Color.fromRGBO(240, 245, 255, 1),
                    margin: EdgeInsets.symmetric(horizontal: defaultSize * 0.4),
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
                            padding: EdgeInsets.all(defaultSize * 0.4),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              subCategoryList[index].name,
                              style: TextStyle(
                                fontSize: defaultSize * 2,
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