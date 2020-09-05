import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';

class Sonnion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: defaultSize * 0.7, horizontal: defaultSize * 0.9),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Sonnion',
            style: TextStyle(
              fontSize: defaultSize * 4.3,
              fontWeight: FontWeight.w500,
              color: sonyBlack,
            ),
          ),
        ),
      ],
    );
  }
}