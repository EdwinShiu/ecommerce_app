import 'package:ecommerce_app/authentication/auth.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  
  final Function toggleLoginPage;
  RegisterPage({this.toggleLoginPage});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Form(
        key: _formKey,
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
                  'Register',
                    style: GoogleFonts.ptSans(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w500,
                    color: sonyBlack,
                  ),
                ), 
              ),
              TextFormField(
                validator: (value) => value.isEmpty ? 'Enter a username' : null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                  hintStyle: GoogleFonts.ptSans(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7F797D),
                  ),
                  errorStyle: GoogleFonts.ptSans(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                onChanged: (value) {
                  setState(() => username = value);
                },
              ),
              SizedBox(height: 40),
              TextFormField(
                validator: (value) => value.length < 8 ? 'The password must not be less than 8 character' : null, 
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  hintStyle: GoogleFonts.ptSans(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7F797D),
                  ),
                  errorStyle: GoogleFonts.ptSans(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
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
                  'Register',
                  style: GoogleFonts.ptSans(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerAccount(username, password);
                    if (result == null) {
                      setState(() {
                        error = 'Please give a valid username or password.';
                      });
                    }
                    else {
                      widget.toggleLoginPage();
                    }
                  }
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: sonyBlack,
                child: Text(
                  'Already have an account',
                  style: GoogleFonts.ptSans(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  widget.toggleLoginPage();
                  FocusScope.of(context).unfocus();
                },
              ),
              SizedBox(height: 30),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}