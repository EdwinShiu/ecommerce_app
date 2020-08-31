import 'package:ecommerce_app/authentication/auth.dart';
import 'package:ecommerce_app/parts/loadingScreen.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../Parts/textFormField.dart';

class RegisterPage extends StatefulWidget {
  
  final Function toggleLoginPage;
  RegisterPage({this.toggleLoginPage});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final double defaultSize = SizeConfig.defaultSize;
  bool loading = false;

  String username = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(defaultSize * 4.3),
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
                    height: defaultSize * 8.7,
                    child: Text(
                      'Register',
                        style: TextStyle(
                        fontSize: defaultSize * 4.3,
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
                  SizedBox(height: defaultSize * 3.5),
                  TextFormField(
                    validator: (value) => value.length < 8 ? 'The password must not be less than 8 character' : null, 
                    decoration: textFormFieldDecoration.copyWith(hintText: 'Password'),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() => password = value);
                    },
                  ),
                  SizedBox(height: defaultSize * 5.2),
                  RaisedButton(
                    color: sonyBlack,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: defaultSize * 1.7,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.registerAccount(username, password);
                        if (result == null) {
                          if (this.mounted) {
                            setState(() {
                              loading = false;
                            });
                          }
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
                  SizedBox(height: defaultSize * 1.7),
                  RaisedButton(
                    color: sonyBlack,
                    child: Text(
                      'Already have an account',
                      style: TextStyle(
                        fontSize: defaultSize * 1.7,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      widget.toggleLoginPage();
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  SizedBox(height: defaultSize * 2.6),
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: defaultSize * 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        (loading) ? LoadingScreen() : Container(),
      ],
    );
  }
}