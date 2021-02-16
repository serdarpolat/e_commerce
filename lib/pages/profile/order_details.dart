import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  final Function closeOrderDetails;

  const OrderDetails({Key key, this.closeOrderDetails}) : super(key: key);
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
                    onPressed: closeOrderDetails,
                    color: gray,
                  ),
                  Text(
                    "Order Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                    color: gray,
                  ),
                ],
              ),
            ),
            SizedBox(height: hh(18)),
            padding(
              child: Row(
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
            ),
            SizedBox(height: hh(18)),
            padding(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  Text(
                    "Delivered",
                    style: TextStyle(
                      fontSize: 15,
                      color: success,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: hh(18)),
            padding(
              child: Text(
                "3 items",
                style: TextStyle(
                  fontSize: 15,
                  color: white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: hh(18)),
            padding(child: item(img: "1")),
            SizedBox(height: hh(18)),
            padding(child: item(img: "2")),
            SizedBox(height: hh(18)),
            padding(child: item(img: "3")),
            SizedBox(height: hh(24)),
            padding(
              child: Text(
                "Order information",
                style: TextStyle(
                  fontSize: 15,
                  color: white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: hh(15)),
            padding(
              child: Container(
                width: ww(343),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shipping address:",
                          style: TextStyle(
                            fontSize: 15,
                            color: gray,
                          ),
                        ),
                        SizedBox(width: ww(15)),
                        Container(
                          width: ww(215),
                          child: Text(
                            "3 Newbridge Court, Chino Hills,CA 91709, United States",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15,
                              color: white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: hh(20)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment method:",
                          style: TextStyle(
                            fontSize: 15,
                            color: gray,
                          ),
                        ),
                        SizedBox(width: ww(15)),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/icons/mastercard.png",
                              width: ww(32),
                              height: hh(25),
                            ),
                            SizedBox(width: ww(15)),
                            Text(
                              "**** **** **** 3947",
                              style: TextStyle(
                                fontSize: 15,
                                color: white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: hh(20)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery method:",
                          style: TextStyle(
                            fontSize: 15,
                            color: gray,
                          ),
                        ),
                        SizedBox(width: ww(15)),
                        Container(
                          width: ww(215),
                          child: Text(
                            "FedEx, 3 days, 15\$",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15,
                              color: white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: hh(20)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total amount:",
                          style: TextStyle(
                            fontSize: 15,
                            color: gray,
                          ),
                        ),
                        SizedBox(width: ww(15)),
                        Container(
                          width: ww(215),
                          child: Text(
                            "133\$",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15,
                              color: white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: hh(34)),
            padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: ww(160),
                    height: hh(36),
                    child: Center(
                      child: Text("Reorder",
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: bg,
                      border: Border.all(
                        color: white,
                        width: 1,
                      ),
                    ),
                  ),
                  Container(
                    width: ww(160),
                    height: hh(36),
                    child: Center(
                      child: Text("Leave feedback",
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: hh(100)),
          ],
        ),
      ),
    );
  }
}

Widget item({String img}) => Container(
      width: ww(343),
      height: hh(104),
      decoration: BoxDecoration(
          color: dark,
          borderRadius: BorderRadius.circular(hh(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 1),
              blurRadius: 25,
            ),
          ]),
      child: Row(
        children: [
          Container(
            width: hh(104),
            height: hh(104),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/images/w_top_$img.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(hh(8)),
                bottomLeft: Radius.circular(hh(8)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: hh(104),
              padding: EdgeInsets.all(hh(10)),
              decoration: BoxDecoration(
                color: dark,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(hh(8)),
                  bottomRight: Radius.circular(hh(8)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pullover",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                  SizedBox(height: hh(4)),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1,
                          ),
                          children: [
                            TextSpan(
                              text: "Color:",
                              style: TextStyle(
                                color: gray,
                              ),
                            ),
                            TextSpan(
                              text: " Gray",
                              style: TextStyle(
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: ww(13)),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1,
                          ),
                          children: [
                            TextSpan(
                              text: "Size:",
                              style: TextStyle(
                                color: gray,
                              ),
                            ),
                            TextSpan(
                              text: " L",
                              style: TextStyle(
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1,
                          ),
                          children: [
                            TextSpan(
                              text: "Units:",
                              style: TextStyle(
                                color: gray,
                              ),
                            ),
                            TextSpan(
                              text: " 1",
                              style: TextStyle(
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "51\$",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
