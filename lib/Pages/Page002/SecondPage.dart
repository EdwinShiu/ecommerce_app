import 'package:ecommerce_app/Pages/Page002/item.dart';
import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/data/category.dart';
import 'package:ecommerce_app/data/items.dart';
import 'package:ecommerce_app/data/routing.dart';
import 'package:ecommerce_app/parts/loadingScreen.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../../constant.dart';
import 'itemPage.dart';

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    final BigCategoryList bigCategory = Provider.of<BigCategoryList>(context);
    //print("happy " + bigCategory.bigCategory.length.toString());
    final RouteGenerator route = Provider.of<RouteGenerator>(context);
    print(route.routeName1);
    final double defaultSize = SizeConfig.defaultSize;
    if (bigCategory == null) {
      return LoadingScreen();
    }
    if (route.routeName1 == "/root") {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: defaultSize * 0.7, horizontal: defaultSize * 0.9),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Category',
              style: TextStyle(
                fontSize: defaultSize * 4.3,
                fontWeight: FontWeight.w500,
                color: sonyBlack,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: defaultSize * 0.9, left: defaultSize * 0.9, right: defaultSize * 0.9),
              child: ListView.builder(
                itemCount: bigCategory.bigCategory.length,
                cacheExtent: defaultSize * 17.4,
                itemBuilder: (context, listIndex) {   
                  //print("$listIndex: " + bigCategory.bigCategory[listIndex].name.toString());     
                  //print(bigCategory.bigCategory[listIndex].categories.length.toString());
                  return StickyHeader(
                    header: Container(
                      padding: EdgeInsets.only(left: defaultSize * 0.9),
                      height: defaultSize * 4.3,
                      color: sonyRed,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        bigCategory.bigCategory[listIndex].name,
                        style: TextStyle(
                          fontSize: defaultSize * 2.2,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    content: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: bigCategory.bigCategory[listIndex].categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context, gridIndex) {   
                        return Container(
                          color: itemBackgroundColor,
                          margin: EdgeInsets.all(defaultSize * 0.4),
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
                                        bigCategory.bigCategory[listIndex].categories[gridIndex].name,
                                        style: TextStyle(
                                          fontSize: defaultSize * 2.1,
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
                                    //setState(() {
                                      bigCategory.bigCategoryIndex = listIndex;
                                      bigCategory.categoryIndex = gridIndex;
                                    //});
                                    route.toSubCategoryPage();
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
      );
    }
    else if (route.routeName1 == "/subCat") {
      return Provider<List<SubCategory>>.value (
        value: bigCategory.subCategoryList,
        child: SubCatPage(),
      );
    }
    else {
      return ItemPage(
        key: UniqueKey(),
      );
    }
  }
}
