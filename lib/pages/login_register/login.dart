import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Size get s => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        width: s.width,
        height: s.height,
        color: bg,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: hh(18)),
              padding(child: heading(title: "Login")),
              SizedBox(height: hh(73)),
              padding(
                child: textField(s, "Email",
                    isActive: false,
                    obsecureText: false,
                    keyboardType: TextInputType.emailAddress),
              ),
              SizedBox(height: hh(8)),
              padding(
                child: textField(s, "Password",
                    isActive: false,
                    obsecureText: true,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: hh(16)),
              padding(
                child: forgotOrHaveAccount(title: "Forgot your password?"),
              ),
              SizedBox(height: hh(32)),
              padding(
                child: primaryButton(s, title: "LOGIN"),
              ),
              SizedBox(height: hh(194)),
              Container(
                width: s.width,
                child: Text(
                  "or login with social account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
              SizedBox(height: hh(12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialButton(img: "google"),
                  SizedBox(width: 19),
                  socialButton(img: "facebook"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
