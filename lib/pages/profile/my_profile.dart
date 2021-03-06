import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  final Function openMyOrders;

  const MyProfile({Key key, this.openMyOrders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: s.height,
      color: bg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: s.width,
            height: hh(88),
            color: bg,
            padding: EdgeInsets.only(top: hh(40)),
            alignment: Alignment.centerRight,
            child: padding(
              child: Icon(
                Icons.search,
                size: hh(24),
                color: white,
              ),
            ),
          ),
          SizedBox(height: hh(18)),
          padding(
            child: Text(
              "My profile",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: white,
              ),
            ),
          ),
          SizedBox(height: hh(24)),
          padding(
            child: Container(
              width: ww(343),
              height: hh(64),
              child: Row(
                children: [
                  Container(
                    width: hh(64),
                    height: hh(64),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/images/profile.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: ww(20)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Jane Doe",
                        style: TextStyle(
                          fontSize: hh(18),
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                      SizedBox(
                        height: hh(6),
                      ),
                      Text(
                        "janedoe@mail.com",
                        style: TextStyle(
                          fontSize: hh(14),
                          color: gray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: hh(28)),
          profileMenuItem(s,
              title: "My orders",
              subtitle: "Already have 12 orders",
              ontap: openMyOrders),
          profileMenuItem(s,
              title: "Shipping addresses",
              subtitle: "3 addresses",
              ontap: () {}),
          profileMenuItem(s,
              title: "Payment methods", subtitle: "Visa **34", ontap: () {}),
          profileMenuItem(s,
              title: "Promocodes",
              subtitle: "You have special promocodes",
              ontap: () {}),
          profileMenuItem(s,
              title: "My reviews",
              subtitle: "Reviews for 4 items",
              ontap: () {}),
          profileMenuItem(s,
              title: "Settings",
              subtitle: "Notifications, password",
              ontap: () => pushPage(Settings(), context: context)),
        ],
      ),
    );
  }
}

Widget profileMenuItem(Size s,
        {String title, String subtitle, Function ontap}) =>
    Container(
      width: s.width,
      height: hh(72),
      padding: EdgeInsets.symmetric(horizontal: ww(16), vertical: hh(18)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
              Spacer(),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: gray,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            color: gray,
            onPressed: ontap,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: bg,
        border: Border(
          bottom: BorderSide(
            color: gray,
            width: 0.25,
          ),
        ),
      ),
    );
