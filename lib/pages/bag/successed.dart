import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Successed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: s.width,
        height: s.height,
        color: bg,
        child: Column(
          children: [
            Spacer(),
            Container(
              width: ww(210),
              height: ww(210),
              child: Image.asset(
                "assets/images/images/bags.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: hh(49)),
            Text(
              "Success!",
              style: TextStyle(
                color: white,
                fontSize: 37,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: hh(12)),
            Text(
              "Your order will be delivered soon.\nThank you for choosing our app!",
              style: TextStyle(
                color: white,
                fontSize: 16,
              ),
            ),
            Spacer(),
            padding(child: Consumer<PageState>(
              builder: (context, state, child) {
                return primaryButton(s, title: "CONTINUE SHOPPING",
                    function: () {
                  state.changePage(0);
                  pushPage(Home(), context: context);
                });
              },
            )),
            SizedBox(height: hh(59)),
          ],
        ),
      ),
    );
  }
}
