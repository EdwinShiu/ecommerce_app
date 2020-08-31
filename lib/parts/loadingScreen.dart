import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double defaultSize = SizeConfig.defaultSize;
    return Material(
      color: Colors.white,
      child: Center(
        child: SpinKitDualRing(
          color: sonyBlack,
          size: defaultSize * 4.3,
        ),
      ),
    );
  }
}