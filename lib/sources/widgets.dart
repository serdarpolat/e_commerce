import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Row forgotOrHaveAccount({String title}) => Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            color: white,
            fontSize: 15,
            letterSpacing: 1,
          ),
        ),
        SizedBox(width: 8),
        Icon(
          Icons.arrow_forward,
          color: primary,
        ),
      ],
    );

Container socialButton({String img}) => Container(
      width: hh(64),
      height: hh(64),
      padding: EdgeInsets.all(hh(20)),
      child: Image.asset("assets/images/images/$img.png"),
      decoration: BoxDecoration(
        color: white,
        shape: BoxShape.circle,
      ),
    );

Widget primaryButton(Size s, {String title, Function function}) =>
    GestureDetector(
      onTap: function,
      child: Container(
        width: s.width,
        height: hh(48),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEF3651).withOpacity(0.35),
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: text,
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );

Container outlineButton(Size s, {String title}) => Container(
      width: s.width,
      height: 57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: white,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: text,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
      ),
    );

Container mediumButton({String title}) => Container(
      width: ww(160),
      height: hh(36),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: white,
            letterSpacing: 1.2,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(30),
      ),
    );

Padding padding({Widget child}) =>
    Padding(padding: EdgeInsets.symmetric(horizontal: ww(16)), child: child);

Container textField(Size s, String labeltext,
        {bool isActive, bool obsecureText, TextInputType keyboardType}) =>
    Container(
      width: s.width,
      height: hh(64),
      decoration: BoxDecoration(
        color: dark,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: TextField(
          obscureText: obsecureText,
          cursorColor: white,
          keyboardType: keyboardType,
          style: TextStyle(
            color: text,
            fontSize: 17,
          ),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.check,
              color: isActive ? success : dark,
            ),
            labelText: labeltext,
            labelStyle: TextStyle(
              color: gray,
              fontSize: 13,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );

Text heading({String title}) => Text(
      title,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: white,
      ),
    );

AppBar customAppBar({String title, Function ontap}) => AppBar(
      elevation: 0,
      centerTitle: true,
      title: title != null ? Text(title) : Text(""),
      leading: ontap != null ? backButton(ontap: ontap) : Container(),
      backgroundColor: bg,
    );

IconButton backButton({Function ontap}) => IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: ontap,
      color: white,
    );

Widget sliderItemHeader({String title, String subtitle}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: ww(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: hh(34),
                  fontWeight: FontWeight.w800,
                  color: white,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: hh(11),
                  color: gray,
                ),
              ),
            ],
          ),
          Text(
            "View all",
            style: TextStyle(
              fontSize: hh(11),
              fontWeight: FontWeight.w600,
              color: white,
            ),
          ),
        ],
      ),
    );

Widget smallButton({Color color, String title}) => Padding(
      padding: EdgeInsets.all(hh(8)),
      child: Container(
        width: ww(40),
        height: hh(24),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );

Widget likeButton({Color color}) => Container(
      width: ww(36),
      height: ww(36),
      child: Center(
        child: Icon(
          Icons.favorite_border,
          size: ww(13),
          color: gray,
        ),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: dark,
            offset: Offset(0, 1),
            blurRadius: 8,
          ),
        ],
      ),
    );

Widget topBar(Size s) => Container(
      width: s.width,
      height: hh(88),
      color: bg,
      alignment: Alignment.bottomRight,
      child: IconButton(
        icon: Icon(Icons.search),
        color: white,
        onPressed: () {},
      ),
    );

Future<dynamic> pushPage(Widget page, {BuildContext context}) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
