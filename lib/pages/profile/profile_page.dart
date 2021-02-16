import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Size get s => MediaQuery.of(context).size;
  bool myOrders = false;
  bool orderDetails = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: s.width,
      height: s.height,
      color: bg,
      child: !myOrders & !orderDetails
          ? MyProfile(
              openMyOrders: () {
                setState(() {
                  myOrders = !myOrders;
                });
              },
            )
          : myOrders & !orderDetails
              ? MyOrders(
                  closeMyOrders: () {
                    setState(() {
                      myOrders = !myOrders;
                    });
                  },
                  openOrderDetails: () {
                    setState(() {
                      orderDetails = !orderDetails;
                    });
                  },
                )
              : OrderDetails(closeOrderDetails: () {
                  setState(() {
                    orderDetails = !orderDetails;
                  });
                }),
    );
  }
}
