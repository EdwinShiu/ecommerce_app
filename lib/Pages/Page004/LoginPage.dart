import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/parts/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../authentication/auth.dart';
import '../../Parts/textFormField.dart';

class LoginPage extends StatefulWidget {

  final Function toggleLoginPage;
  LoginPage({this.toggleLoginPage});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;


  String username = '';
  String password = '';
  String error = '';

  @override
  void didUpdateWidget (LoginPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("did Update Widget");
    print(loading);
  }

  @override
  Widget build(BuildContext context) {
    return (loading) ? LoadingScreen() : Container(
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
                  'Login',
                    style: GoogleFonts.ptSans(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w500,
                    color: sonyBlack,
                  ),
                ), 
              ),
              TextFormField(
                validator: (value) => value.isEmpty ? 'Enter a username' : null,
                decoration: textFormFieldDecoration.copyWith(hintText: 'Username'),
                onChanged: (value) {
                  setState(() => username = value);
                },
              ),
              SizedBox(height: 40),
              TextFormField(
                validator: (value) => value.isEmpty ? 'Enter a password' : null,
                decoration: textFormFieldDecoration.copyWith(hintText: 'Password'),
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
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    print('before setState');
                    setState(() {
                      loading = true;
                    });
                    print("before await");
                    dynamic result = await _auth.signInAccount(username, password);
                    print("after await");
                    if (result == null) {   
                      if (this.mounted) {
                        setState(() {
                          loading = false;
                          error = 'Could not sign in.';
                        });
                      }
                    }
                  }
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
                  widget.toggleLoginPage();
                  FocusScope.of(context).unfocus();
                },
              ),
              /*
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
              */
              SizedBox(height: 20),
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
