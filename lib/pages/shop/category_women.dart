import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class CategoryWomen extends StatefulWidget {
  final Function ontap;

  const CategoryWomen({Key key, this.ontap}) : super(key: key);
  @override
  _CategoryWomenState createState() => _CategoryWomenState();
}

class _CategoryWomenState extends State<CategoryWomen> {
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
            oppinion(s, header: "SUMMER SALE", title: "Up to 50% off"),
            ...List.generate(womenCategories.length, (index) {
              return category(s,
                  context: context,
                  model: womenCategories[index],
                  ontap: widget.ontap);
            }),
          ],
        ),
      ),
    );
  }
}
