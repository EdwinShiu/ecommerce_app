import 'package:ecommerce_app/data/service/fetchProduct.dart';
import 'package:ecommerce_app/parts/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../constant.dart';
import '../../sizeConfig.dart';
import './newItem.dart';

class FrontPage extends StatefulWidget {
  @override
  FrontPageState createState() => FrontPageState();
}

class FrontPageState extends State<FrontPage> {
  int _current = 0;
  List<int> list = [0, 1, 2, 3, 4];
  final List<String> bannerList = [
    'assets/images/WM1Z_banner.jpg',
    'assets/images/WM1A_banner.jpg',
    'assets/images/ZX500_banner.jpg',
    'assets/images/A100_banner.jpg',
    'assets/images/A50_banner.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: defaultSize * 2),
          child: CarouselSlider(
            options: CarouselOptions(
              height: defaultSize * 22,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 15),
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(seconds: 3),
              onPageChanged: (index, _) {
                setState(() {
                  _current = index;
                });
              }
            ),
            items: list.map((item) => Container(
              constraints: BoxConstraints.expand(),
              child: Image.asset(
                bannerList[item],
                fit: BoxFit.fitHeight,
              ),
            )).toList(),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerList.map((url) {
              int index = bannerList.indexOf(url);
              return Container(
                width: defaultSize * 0.7,
                height: defaultSize * 0.7,
                margin: EdgeInsets.only(top: defaultSize * 0.5, left: defaultSize * 0.2, right: defaultSize * 0.2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: defaultSize * 0.7),
          child: Text(
            'New',
            style: TextStyle(
              fontSize: defaultSize * 2.8,
              fontWeight: FontWeight.w500,
              color: sonyBlack,
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: fetchProduct(),
            builder: (context, snapshot) {
              return snapshot.hasData ? NewItem(snapshot.data) : LoadingScreen();
            }
          ),
        ),
      ],
    );
  }
}
