import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './newItem.dart';

const List<String> bannerList = [
  'assets/images/WM1Z_banner.jpg',
  'assets/images/WM1A_banner.jpg',
  'assets/images/ZX500_banner.jpg',
  'assets/images/A100_banner.jpg',
  'assets/images/A50_banner.jpg'
];

class FrontPage extends StatefulWidget {
  @override
  FrontPageState createState() => FrontPageState();
}

class FrontPageState extends State<FrontPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List<int> list = [0, 1, 2, 3, 4];
    return Column(
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
          height: 25,
          //color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerList.map((url) {
              int index = bannerList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
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
              fontWeight: FontWeight.w600,
              color: Color(0xFF3D66B9),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              newItem(0),
              newItem(1),
              newItem(2),
              newItem(3),
              newItem(4),
            ],
          ),
        ),
      ],
    );
  }
}
