import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Checkout"),
        backgroundColor: bg,
      ),
      body: Container(
        width: s.width,
        height: s.height,
        color: bg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: hh(31)),
            padding(
              child: Text(
                "Shipping address",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
            ),
            SizedBox(height: hh(21)),
            padding(
              child: Container(
                width: ww(343),
                height: hh(108),
                padding: EdgeInsets.all(ww(24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Jane Doe",
                          style: TextStyle(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              pushPage(ShippingAddresses(), context: context),
                          child: Container(
                            child: Text(
                              "Change",
                              style: TextStyle(
                                color: primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "3 Newbridge Court Chino Hills, CA 91709, United States",
                      style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(hh(8)),
                  color: dark,
                ),
              ),
            ),
            SizedBox(height: hh(56)),
            padding(
              child: Container(
                width: ww(320),
                height: hh(72),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment",
                          style: TextStyle(
                            color: white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Change",
                          style: TextStyle(
                            color: primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: hh(17)),
                    Row(
                      children: [
                        Container(
                          width: ww(64),
                          height: hh(38),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(hh(8)),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/icons/mastercard.png"),
                              scale: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(width: ww(17)),
                        Text(
                          "****  ****  ****  3947",
                          style: TextStyle(
                            color: gray,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: hh(51)),
            padding(
              child: Container(
                width: ww(343),
                height: hh(109),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery method",
                      style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: hh(21)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        deliveryMethod(img: "fedex"),
                        deliveryMethod(img: "usps"),
                        deliveryMethod(img: "dhl"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: hh(52)),
            padding(
              child: Container(
                width: ww(343),
                height: hh(90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    amount(title: "Order", price: "112"),
                    amount(title: "Delivery", price: "15"),
                    Divider(
                      color: gray,
                    ),
                    amount(title: "Summary", price: "127"),
                  ],
                ),
              ),
            ),
            SizedBox(height: ww(16)),
            padding(
                child: primaryButton(s,
                    title: "SUBMIT ORDER",
                    function: () =>
                        pushPage(PaymentMethod(), context: context))),
          ],
        ),
      ),
    );
  }
}

Widget amount({String title, String price}) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title:",
          style: TextStyle(
            color: gray,
            fontSize: hh(14),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "$price\$",
          style: TextStyle(
            color: white,
            fontSize: hh(16),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );

Widget deliveryMethod({String img}) => Container(
      width: ww(100),
      height: hh(72),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          padding(
            child: Image.asset("assets/images/icons/$img.png"),
          ),
          SizedBox(height: hh(9)),
          Text(
            "2-3 days",
            style: TextStyle(
              color: gray,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(hh(8)),
        color: white,
      ),
    );
