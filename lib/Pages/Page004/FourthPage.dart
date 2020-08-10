import 'package:ecommerce_app/Pages/Page004/RegisterPage.dart';
import 'package:flutter/material.dart';
import '../../data/user.dart';
import 'package:provider/provider.dart';
import 'LoginPage.dart';
import 'UserPage.dart';

class FourthPage extends StatefulWidget {
  @override
  FourthPageState createState() => FourthPageState();
}

class FourthPageState extends State<FourthPage> {

  bool isLoggedIn = false;

  void toggleLoginPage() {
    setState(() => isLoggedIn = !isLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // print(user);

    if (user == null) {
      if (!isLoggedIn) {
        return LoginPage(toggleLoginPage: toggleLoginPage);
      }
      else {
        return RegisterPage(toggleLoginPage: toggleLoginPage);
      }
    }
    return AnonPage();
  }
}