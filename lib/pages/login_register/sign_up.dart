import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Size get s => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(ontap: () {
        Navigator.of(context).pop();
      }),
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
              padding(child: heading(title: "Sign Up")),
              SizedBox(height: hh(73)),
              padding(
                child: textField(s, "Name",
                    isActive: false,
                    obsecureText: false,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: hh(8)),
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
                child: forgotOrHaveAccount(title: "Already have an account?"),
              ),
              SizedBox(height: hh(32)),
              padding(
                child: primaryButton(s, title: "SIGN UP"),
              ),
              SizedBox(height: hh(126)),
              Container(
                width: s.width,
                child: Text(
                  "or login with social account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
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
