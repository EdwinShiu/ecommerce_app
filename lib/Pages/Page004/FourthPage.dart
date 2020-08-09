import 'package:flutter/material.dart';
import '../../data/user.dart';
import 'package:provider/provider.dart';
import 'LoginPage.dart';
import 'UserPage.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      return LoginPage();
    }
    return AnonPage();
  }
}