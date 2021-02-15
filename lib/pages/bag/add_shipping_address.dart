import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class AddShippingAddresses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Shipping addresses"),
        backgroundColor: bg,
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
              SizedBox(height: hh(31)),
              padding(
                child: textField(s, "Full name",
                    isActive: false,
                    obsecureText: true,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: hh(20)),
              padding(
                child: textField(s, "Address",
                    isActive: false,
                    obsecureText: true,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: hh(20)),
              padding(
                child: textField(s, "City",
                    isActive: false,
                    obsecureText: true,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: hh(20)),
              padding(
                child: textField(s, "State/Province/Region",
                    isActive: false,
                    obsecureText: true,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: hh(20)),
              padding(
                child: textField(s, "Zipcode (Postal Code)",
                    isActive: false,
                    obsecureText: true,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: hh(20)),
              padding(
                child: textField(s, "Country",
                    isActive: false,
                    obsecureText: true,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: hh(41)),
              padding(
                child: primaryButton(s,
                    title: "SAVE ADDRESS",
                    function: () => Navigator.pop(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
