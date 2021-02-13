import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: s.width,
              height: hh(536),
              child: Stack(
                children: [
                  Positioned(
                    left: ww(10),
                    top: hh(354),
                    child: Container(
                      width: ww(190),
                      height: hh(150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fashion Sale",
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w800,
                              color: white,
                            ),
                          ),
                          Spacer(),
                          mediumButton(title: "Check"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/images/fashion_sale.png",
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: hh(33)),
            SliderItem(
              items: newItems,
              title: "New",
              subtitle: "You've never seen it before!",
            ),
            SizedBox(height: hh(24)),
            Container(
              width: s.width,
              height: hh(196),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: ww(16), bottom: hh(26)),
                child: Text(
                  "Street Clothes",
                  style: TextStyle(
                    color: white,
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/images/street_clothes.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: hh(33)),
            SliderItem(
              items: discountItems,
              title: "Sale",
              subtitle: "Super summer sale!",
            ),
            SizedBox(height: hh(33)),
            Container(
              width: s.width,
              height: hh(366),
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: ww(18), bottom: hh(27)),
                child: Text(
                  "New collection",
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/images/new_coll.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: s.width / 2,
                      height: s.width / 2,
                      color: bg,
                      padding: EdgeInsets.all(ww(15)),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Summer sale",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w700,
                          fontSize: 34,
                        ),
                      ),
                    ),
                    Container(
                      width: s.width / 2,
                      height: s.width / 2,
                      padding: EdgeInsets.all(ww(15)),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Black",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w700,
                          fontSize: 34,
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/images/black.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: s.width / 2,
                  height: s.width,
                  padding: EdgeInsets.only(left: ww(15), top: hh(59)),
                  child: Text(
                    "Men's\nhats",
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w700,
                      fontSize: 34,
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      scale: 1.1,
                      image: AssetImage(
                        "assets/images/images/man_hat.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: hh(83) - 12),
          ],
        ),
      ),
    );
  }
}
