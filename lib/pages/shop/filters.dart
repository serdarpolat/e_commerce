import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  RangeValues selectedRange = RangeValues(0.1, 500.0);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bg,
        title: Text("Filters"),
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
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$" + selectedRange.start.toStringAsFixed(2),
                          style: TextStyle(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "\$" + selectedRange.end.toStringAsFixed(2),
                          style: TextStyle(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    RangeSlider(
                      values: selectedRange,
                      onChanged: (val) {
                        setState(() {
                          selectedRange = val;
                        });
                      },
                      min: 0.1,
                      max: 500.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: hh(19)),
            Divider(
              color: gray.withOpacity(0.25),
              height: 0.1,
            ),
            SizedBox(height: hh(19)),
            padding(
              child: Text(
                "Colors",
                style: TextStyle(
                  color: white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: hh(24)),
            padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  coolor(color: Color(0xff020202)),
                  coolor(color: Color(0xfff6f6f6)),
                  coolor(color: Color(0xffF48117)),
                  coolor(color: Color(0xffBEA9A9)),
                  coolor(color: Color(0xff91BA4F)),
                  coolor(color: Color(0xff2CB1B1)),
                ],
              ),
            ),
            SizedBox(height: hh(19)),
            Divider(
              color: gray.withOpacity(0.25),
              height: 0.1,
            ),
            SizedBox(height: hh(19)),
            padding(
              child: Text(
                "Sizes",
                style: TextStyle(
                  color: white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: hh(24)),
            padding(
              child: Row(
                children: [
                  sizes(title: "XS", selected: false),
                  sizes(title: "S", selected: true),
                  sizes(title: "M", selected: true),
                  sizes(title: "L", selected: false),
                  sizes(title: "XL", selected: false),
                ],
              ),
            ),
            SizedBox(height: hh(19)),
            Divider(
              color: gray.withOpacity(0.25),
              height: 0.1,
            ),
            SizedBox(height: hh(19)),
            padding(
              child: Text(
                "Category",
                style: TextStyle(
                  color: white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: hh(24)),
            padding(
              child: Wrap(
                spacing: ww(16),
                runSpacing: ww(16),
                children: [
                  categorys(title: "All", select: true),
                  categorys(title: "Women", select: false),
                  categorys(title: "Men", select: false),
                  categorys(title: "Boys", select: false),
                  categorys(title: "Girls", select: false),
                ],
              ),
            ),
            SizedBox(height: hh(19)),
            Divider(
              color: gray.withOpacity(0.25),
              height: 0.1,
            ),
            SizedBox(height: hh(19)),
            padding(
              child: GestureDetector(
                onTap: () => pushPage(BrandList(), context: context),
                child: Container(
                  width: ww(343),
                  color: bg,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Brand",
                            style: TextStyle(
                              color: white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: hh(6)),
                          Text(
                            "adidas Originals, Jack & Jones, s. Oliver...",
                            style: TextStyle(
                              color: gray,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, color: white),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: hh(19)),
            Divider(
              color: gray.withOpacity(0.25),
              height: 0.1,
            ),
            SizedBox(height: hh(19)),
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
          ],
        ),
      ),
    );
  }
}

Widget categorys({String title, bool select}) => Container(
      width: ww(100),
      height: hh(40),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: select ? bg : white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: select ? primary : bg,
        borderRadius: BorderRadius.circular(hh(8)),
        border: Border.all(
          color: select ? primary : gray,
          width: 0.4,
        ),
      ),
    );

Widget sizes({String title, bool selected}) => Container(
      margin: EdgeInsets.only(right: ww(16)),
      width: hh(40),
      height: hh(40),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: selected ? bg : white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: selected ? primary : bg,
        borderRadius: BorderRadius.circular(hh(8)),
        border: Border.all(
          color: selected ? primary : gray,
          width: 0.4,
        ),
      ),
    );

Widget coolor({Color color}) => Container(
      width: hh(36),
      height: hh(36),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
