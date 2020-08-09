import 'package:ecommerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../authentication/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Form(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: Text(
                  'Login',
                    style: GoogleFonts.ptSans(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w500,
                    color: sonyBlack,
                  ),
                ), 
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                  hintStyle: GoogleFonts.ptSans(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7F797D),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                onChanged: (value) {
                  setState(() => username = value);
                },
              ),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  hintStyle: GoogleFonts.ptSans(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7F797D),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
              SizedBox(height: 60),
              RaisedButton(
                color: sonyBlack,
                child: Text(
                  'Login',
                  style: GoogleFonts.ptSans(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  print(username);
                  print(password);
                  FocusScope.of(context).unfocus();
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: sonyBlack,
                child: Text(
                  'Register a new account',
                  style: GoogleFonts.ptSans(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: sonyBlack,
                child: Text(
                  'Sign in anonymously',
                  style: GoogleFonts.ptSans(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print("Error Signing In");
                  }
                  else {
                    print('Signed In');
                    print(result.uid);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
