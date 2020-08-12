import 'package:ecommerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDualRing(
        color: sonyBlack,
        size: 50.0,
      ),
    );
  }
}