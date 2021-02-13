import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Size get s => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        ontap: () => Navigator.pop(context),
      ),
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
              padding(child: heading(title: "Forgot Password")),
              SizedBox(height: hh(87)),
              padding(
                child: Text(
                  "Please, enter your email address. You will receive a link to create a new password via email.",
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                    letterSpacing: 1,
                    height: 1.4,
                  ),
                ),
              ),
              SizedBox(height: hh(16)),
              padding(
                child: textField(s, "Email",
                    isActive: false,
                    obsecureText: false,
                    keyboardType: TextInputType.emailAddress),
              ),
              SizedBox(height: hh(55)),
              padding(
                child: primaryButton(s, title: "SEND"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
