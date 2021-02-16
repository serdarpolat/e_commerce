import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  final Function closeMyOrders;
  final Function openOrderDetails;

  const MyOrders({Key key, this.closeMyOrders, this.openOrderDetails})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: s.height,
      color: bg,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: s.width,
              height: hh(88),
              color: bg,
              padding: EdgeInsets.only(top: hh(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: closeMyOrders,
                    color: gray,
                  ),
                ],
              ),
            ),
            SizedBox(height: hh(18)),
            padding(
              child: Text(
                "My Orders",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
            ),
            SizedBox(height: hh(24)),
            padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: ww(20)),
                    height: hh(30),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        "Delivered",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: bg,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: ww(20)),
                    height: hh(30),
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        "Processing",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: ww(20)),
                    height: hh(30),
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        "Delivered",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: hh(30)),
            padding(child: orderCard(ontap: openOrderDetails)),
            SizedBox(height: hh(24)),
            padding(child: orderCard()),
            SizedBox(height: hh(24)),
            padding(child: orderCard()),
            SizedBox(height: hh(100)),
          ],
        ),
      ),
    );
  }
}

Widget orderCard({Function ontap}) => GestureDetector(
      onTap: ontap,
      child: Container(
        width: ww(343),
        height: hh(164),
        padding: EdgeInsets.all(ww(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order No1947034",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: white,
                  ),
                ),
                Text(
                  "01-12-2021",
                  style: TextStyle(
                    fontSize: 15,
                    color: gray,
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Tarcking number:",
                    style: TextStyle(
                      fontSize: 16,
                      color: gray,
                    ),
                  ),
                  TextSpan(
                    text: " IW3475453455",
                    style: TextStyle(
                      fontSize: 16,
                      color: white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Quantity:",
                        style: TextStyle(
                          fontSize: 16,
                          color: gray,
                        ),
                      ),
                      TextSpan(
                        text: " 3",
                        style: TextStyle(
                          fontSize: 16,
                          color: white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Total amount:",
                        style: TextStyle(
                          fontSize: 16,
                          color: gray,
                        ),
                      ),
                      TextSpan(
                        text: " 112\$",
                        style: TextStyle(
                          fontSize: 16,
                          color: white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ww(98),
                  height: hh(36),
                  child: Center(
                    child: Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: dark,
                    borderRadius: BorderRadius.circular(36),
                    border: Border.all(
                      color: white,
                      width: 1,
                    ),
                  ),
                ),
                Text(
                  "Delivered",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: success,
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(hh(8)),
          color: dark,
        ),
      ),
    );
