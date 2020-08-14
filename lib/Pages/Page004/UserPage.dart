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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              children: [
                Stack(
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(
                        "Sonnion: 3000",
                        style: GoogleFonts.ptSans(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                          color: sonyBlack,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Ink(
                  width: double.maxFinite,
                  color: sonyBlack,
                  child: InkWell(
                    child: Align(
                      alignment: Alignment.center,
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
                    ),
                    onTap: () {
                      print("Account Information");
                    },
                  ),
                ),
                SizedBox(height: 20),
                Ink(
                  width: double.maxFinite,
                  color: sonyBlack,
                  child: InkWell(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Product Warranty",
                          style: GoogleFonts.ptSans(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      print("Warranty");
                    },
                  ),
                ),
                SizedBox(height: 20),
                Ink(
                  width: double.maxFinite,
                  color: sonyBlack,
                  child: InkWell(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Order Record",
                          style: GoogleFonts.ptSans(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      print("Order");
                    },
                  ),
                ),
                SizedBox(height: 20),
                Ink(
                  width: double.maxFinite,
                  color: sonyBlack,
                  child: InkWell(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Log Out",
                          style: GoogleFonts.ptSans(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      print("Log Out");
                      await _auth.signOut();
                    },
                  ),
                ),
              ],
            )
          ),
          ),
        ],
    );
  }
}