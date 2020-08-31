import 'package:ecommerce_app/authentication/auth.dart';
import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/data/user.dart';
import 'package:ecommerce_app/parts/loadingScreen.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {

  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    final userData = Provider.of<UserData>(context, listen: false);
    //print("userData " + userData.toString());
    final double defaultSize = SizeConfig.defaultSize;
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: defaultSize * 0.7, horizontal: defaultSize * 0.9),
              alignment: Alignment.bottomLeft,
              child: Text(
                'My Sony',
                style: TextStyle(
                  fontSize: defaultSize * 4.3,
                  fontWeight: FontWeight.w500,
                  color: sonyBlack,
                ),
              ),
            ),
            Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultSize * 8.6),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.account_circle,
                          size: defaultSize * 21.7,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Text(
                          "Sonnion: " + ((userData != null) ? userData.userInformation.sonnion.toString() : "--"),
                          style: TextStyle(
                            fontSize: defaultSize * 2.6,
                            fontWeight: FontWeight.w500,
                            color: sonyBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultSize * 1.7),
                  Ink(
                    width: double.maxFinite,
                    color: sonyBlack,
                    child: InkWell(
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(defaultSize * 0.9),
                          child: Text(
                            "Account Information",
                            style: TextStyle(
                              fontSize: defaultSize * 1.7,
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
                  SizedBox(height: defaultSize * 1.7),
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
                            style: TextStyle(
                              fontSize: defaultSize * 1.7,
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
                  SizedBox(height: defaultSize * 1.7),
                  Ink(
                    width: double.maxFinite,
                    color: sonyBlack,
                    child: InkWell(
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(defaultSize * 0.9),
                          child: Text(
                            "Order Record",
                            style: TextStyle(
                              fontSize: defaultSize * 1.7,
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
                  SizedBox(height: defaultSize * 1.7),
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
                            style: TextStyle(
                              fontSize: defaultSize * 1.7,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onTap: () async {
                        print("Log Out");
                        setState(() {
                          loading = true;
                        });
                        await _auth.signOut();
                      },
                    ),
                  ),
                ],
              )
            ),
            ),
          ],
        ),
        (loading) ? LoadingScreen() : Container(),
      ],
    );
  }
}