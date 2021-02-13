import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class ChooseCategory extends StatefulWidget {
  final Function ontap;

  const ChooseCategory({Key key, this.ontap}) : super(key: key);
  @override
  _ChooseCategoryState createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  PageController pageCtrl = PageController();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: hh(88) + ww(16),
        bottom: hh(83) + ww(16),
      ),
      width: s.width,
      height: s.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: ww(16)),
              child: primaryButton(s, title: "VIEW ALL ITEMS"),
            ),
            SizedBox(height: hh(16)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: ww(16)),
              child: Text(
                "Choose category",
                style: TextStyle(
                  color: gray,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: hh(16)),
            ...List.generate(titles.length, (index) {
              return chooseCat(
                s,
                title: titles[index],
                ontap: widget.ontap,
              );
            }),
          ],
        ),
      ),
    );
  }
}

Widget chooseCat(Size s, {String title, Function ontap}) => GestureDetector(
      onTap: ontap,
      child: Container(
        width: s.width,
        height: hh(48),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: ww(40)),
        child: Text(
          title,
          style: TextStyle(
            color: white,
            fontSize: 18,
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: gray,
              width: hh(0.3),
            ),
          ),
        ),
      ),
    );

List<String> titles = [
  "Tops",
  "Shirts & Blouses",
  "Cardigans & Sweaters",
  "Knitwear",
  "Blazers",
  "Outerwear",
  "Pants",
  "Jeans",
  "Shorts",
  "Skirts",
  "Dresses",
  "Others",
];
