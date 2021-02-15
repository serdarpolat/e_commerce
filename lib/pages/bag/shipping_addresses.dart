import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingAddresses extends StatelessWidget {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: hh(31)),
            padding(
              child: addressLayout(),
            ),
            SizedBox(height: hh(21)),
            padding(
              child: addressLayout(),
            ),
            SizedBox(height: hh(21)),
            padding(
              child: addressLayout(),
            ),
            SizedBox(height: hh(40)),
            padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () =>
                        pushPage(AddShippingAddresses(), context: context),
                    child: Container(
                      width: hh(36),
                      height: hh(36),
                      child: Icon(Icons.add, color: bg),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget addressLayout() => Container(
      width: ww(343),
      height: hh(140),
      padding: EdgeInsets.all(hh(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "John Doe",
                style: TextStyle(
                  color: white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Edit",
                style: TextStyle(
                  color: primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            "3 Newbridge Court\nChino Hills, CA 91709, United States",
            style: TextStyle(
              color: white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
          Consumer<Addr1CheckBox>(builder: (context, state, child) {
            return GestureDetector(
              onTap: () {
                state.changeChecked();
              },
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 160),
                    width: hh(20),
                    height: hh(20),
                    child: AnimatedOpacity(
                      opacity: state.isChecked ? 1 : 0,
                      duration: Duration(milliseconds: 120),
                      child: Icon(
                        Icons.check,
                        color: bg,
                        size: 16,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: state.isChecked ? gray : dark,
                      borderRadius: BorderRadius.circular(hh(4)),
                      border: Border.all(
                        color: gray,
                        width: ww(2),
                      ),
                    ),
                  ),
                  SizedBox(width: ww(8)),
                  Text(
                    "Use as the shipping address",
                    style: TextStyle(fontSize: 16, color: white),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
      decoration: BoxDecoration(
        color: dark,
        borderRadius: BorderRadius.circular(hh(8)),
      ),
    );
