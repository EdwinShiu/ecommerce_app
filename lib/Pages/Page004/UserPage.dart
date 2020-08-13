import 'package:ecommerce_app/authentication/auth.dart';
import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/parts/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnonPage extends StatefulWidget {
  @override
  AnonPageState createState() => AnonPageState();
}

class AnonPageState extends State<AnonPage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Signed In",
            style: GoogleFonts.ptSans(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: sonyBlack,
            ),
          ),
          RaisedButton(
            child: Text(
              "Log Out",
              style: GoogleFonts.ptSans(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            color: sonyBlack,
            onPressed: () async {
              await _auth.signOut();
            }
          )
        ],
      )
    );
  }
}