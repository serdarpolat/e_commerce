import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class BrandList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bg,
        title: Text("Brand"),
        centerTitle: true,
      ),
      body: Container(
        width: s.width,
        height: s.height,
        color: bg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: hh(16)),
            padding(
              child: Text(
                "Price range",
                style: TextStyle(
                  color: white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: hh(24)),
            padding(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: ww(18), vertical: hh(8)),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: dark,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff8E8E93),
                    ),
                    labelText: "Search",
                    labelStyle: TextStyle(
                      color: gray,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: hh(8)),
            brandList(title: "adidas", select: false),
            brandList(title: "adidas Originals", select: true),
            brandList(title: "Blend", select: false),
            brandList(title: "Boutique Moschino", select: false),
            brandList(title: "Champion", select: false),
            brandList(title: "Diesel", select: false),
            brandList(title: "Jack & Jones", select: true),
            brandList(title: "Naf Naf", select: false),
            brandList(title: "Red Valentino", select: false),
            brandList(title: "s.Oliver", select: true),
            Spacer(),
            padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: ww(160),
                    height: hh(36),
                    child: Center(
                      child: Text("Discard",
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
                      child: Text("Apply",
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
            SizedBox(height: hh(16)),
          ],
        ),
      ),
    );
  }
}

Widget brandList({String title, bool select}) => padding(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: hh(14)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: select ? FontWeight.w600 : FontWeight.w400,
                color: select ? primary : white,
                letterSpacing: 1,
              ),
            ),
            Container(
              width: hh(20),
              height: hh(20),
              child: Icon(Icons.check, size: select ? 16 : 0, color: white),
              decoration: BoxDecoration(
                color: select ? primary : bg,
                borderRadius: BorderRadius.circular(hh(4)),
                border: Border.all(
                  color: select ? primary : gray,
                  width: hh(2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
