import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class CategoryMen extends StatefulWidget {
  @override
  _CategoryMenState createState() => _CategoryMenState();
}

class _CategoryMenState extends State<CategoryMen> {
  Size get s => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: hh(132),
        left: ww(16),
        right: ww(16),
        bottom: hh(83),
      ),
      width: s.width,
      height: s.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: hh(16)),
            oppinion(s, header: "NEW ARRIVALS", title: "Up to 50% off"),
            ...List.generate(menCategories.length, (index) {
              return category(s, model: menCategories[index]);
            }),
          ],
        ),
      ),
    );
  }
}
