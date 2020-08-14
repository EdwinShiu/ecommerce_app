import 'package:ecommerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SpinKitDualRing(
          color: sonyBlack,
          size: 50.0,
        ),
      ),
    );
  }
}