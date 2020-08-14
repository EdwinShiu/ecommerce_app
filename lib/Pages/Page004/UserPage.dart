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
    return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'My Sony',
              style: GoogleFonts.ptSans(
                fontSize: 50.0,
                fontWeight: FontWeight.w500,
                color: sonyBlack,
              ),
            ),
          ),
          Expanded(
          child: Center(
            child: Column(
              children: [
                Container(
                  color: Colors.yellow,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.account_circle,
                          size: 250,
                        ),
                      ),
                      Container(
                        color: Colors.red,
                        child: Text(
                          "Sonnion",
                          style: GoogleFonts.ptSans(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: sonyBlack,
                          ),
                        ),
                      ),
                    ],
                  ),   
                ),
                Material(
                  color: sonyBlack,
                  child: InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                      "Account Information",
                      style: GoogleFonts.ptSans(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    ),
                    onTap: () {
                      print("Account Information");
                    },
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Warranty",
                    style: GoogleFonts.ptSans(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  color: sonyBlack,
                  onPressed: () {
                    print("Warranty");
                  }, 
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
          ),
          ),
        ],
    );
  }
}