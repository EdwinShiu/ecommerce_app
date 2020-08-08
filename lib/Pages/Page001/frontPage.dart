import 'package:ecommerce_app/data/service/fetchProduct.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../constant.dart';
import '../../data/product.dart';
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
    return  Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 25.0),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 250.0,
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
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.only(top: 6.0, left: 2.0, right: 2.0),
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
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'New',
            style: GoogleFonts.ptSans(
              fontSize: 32.0,
              fontWeight: FontWeight.w500,
              color: sonyBlack,
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: fetchProduct(),
            builder: (context, snapshot) {
              return snapshot.hasData ? NewItem(pageNavigatorKey, snapshot.data) : CircularProgressIndicator();
            }
          ),
        ),
      ],
    );
  }
}
