import 'package:ecommerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rng = Random();
    print(rng.nextInt(255));
    return Center(
      child: SpinKitDualRing(
        color: Color.fromRGBO(rng.nextInt(255), rng.nextInt(255), rng.nextInt(255), 1),
        size: 50.0,
      ),
    );
  }
}