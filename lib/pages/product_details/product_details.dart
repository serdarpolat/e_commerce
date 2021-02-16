import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  PageController ctrl = PageController(initialPage: 0, viewportFraction: 1);
  bool size = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        centerTitle: true,
        title: Text("Short Dress"),
        actions: [
          IconButton(icon: Icon(Icons.share), color: white, onPressed: () {}),
        ],
      ),
      body: Container(
        width: s.width,
        height: s.height,
        color: bg,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    items: [
                      Container(
                        width: ww(275),
                        child: Image.asset(
                          "assets/images/images/slider1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: ww(275),
                        child: Image.asset(
                          "assets/images/images/slider2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: hh(413),
                      aspectRatio: 275 / 413,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      //onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: hh(12)),
                  padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              size = !size;
                            });
                          },
                          child: Container(
                            width: ww(138),
                            height: hh(40),
                            padding: EdgeInsets.all(ww(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Size",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: gray,
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: bg,
                              borderRadius: BorderRadius.circular(hh(8)),
                              border: Border.all(
                                color: error,
                                width: 0.4,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: ww(138),
                          height: hh(40),
                          padding: EdgeInsets.all(ww(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Black",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: gray,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(hh(8)),
                            border: Border.all(
                              color: gray,
                              width: 0.4,
                            ),
                          ),
                        ),
                        likeButton(color: dark),
                      ],
                    ),
                  ),
                  SizedBox(height: hh(22)),
                  padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "H&M",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: white,
                              ),
                            ),
                            Text(
                              "Short black dress",
                              style: TextStyle(
                                fontSize: 13,
                                color: gray,
                              ),
                            ),
                            SizedBox(height: hh(8)),
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: ww(13),
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 1),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              unratedColor: gray,
                              onRatingUpdate: (rating) {
                                //print(rating);
                              },
                            )
                          ],
                        ),
                        Text(
                          "\$19.99",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: hh(16)),
                  padding(
                    child: Container(
                      width: ww(343),
                      child: Text(
                        "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                        style: TextStyle(
                          fontSize: 16,
                          color: text,
                          letterSpacing: 1,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: hh(20)),
                  Divider(
                    color: gray.withOpacity(0.5),
                    height: 0.4,
                  ),
                  detItem(s, title: "Item details"),
                  Divider(
                    color: gray.withOpacity(0.5),
                    height: 0.4,
                  ),
                  detItem(s, title: "Shipping info"),
                  Divider(
                    color: gray.withOpacity(0.5),
                    height: 0.4,
                  ),
                  detItem(s, title: "Support"),
                  Divider(
                    color: gray.withOpacity(0.5),
                    height: 0.4,
                  ),
                  SizedBox(height: hh(24)),
                  SliderItem(
                    items: discountItems,
                    title: "Sale",
                    subtitle: "Super summer sale!",
                  ),
                  SizedBox(height: ww(80)),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 320),
              top: size ? 0 : s.height,
              left: 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 120),
                width: s.width,
                height: s.height,
                color: bg.withOpacity(size ? 0.75 : 0),
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: s.width,
                  height: hh(368),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            size = !size;
                          });
                        },
                        child: Container(
                          width: s.width,
                          height: hh(34),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
                                width: ww(60),
                                height: hh(6),
                                color: gray,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(hh(34)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: hh(12)),
                      Text(
                        "Select size",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                      SizedBox(height: hh(14)),
                      padding(
                        child: Wrap(
                          spacing: ww(16),
                          runSpacing: ww(16),
                          children: [
                            categorys(title: "XS", select: false),
                            categorys(title: "S", select: false),
                            categorys(title: "M", select: false),
                            categorys(title: "L", select: false),
                            categorys(title: "XL", select: false),
                          ],
                        ),
                      ),
                      SizedBox(height: hh(24)),
                      Divider(
                        color: gray.withOpacity(0.5),
                        height: 0.4,
                      ),
                      detItem(s, title: "Size info"),
                      Divider(
                        color: gray.withOpacity(0.5),
                        height: 0.4,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(hh(34)),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, -4),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: s.width,
                padding: EdgeInsets.all(ww(16)),
                child: primaryButton(s, title: "ADD TO CART"),
                decoration: BoxDecoration(
                  color: bg,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff1A1B20),
                      offset: Offset(0, -4),
                      blurRadius: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget detItem(Size s, {String title}) => Container(
      width: s.width,
      height: hh(45),
      color: bg,
      child: padding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: white,
                fontSize: 18,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: white,
            ),
          ],
        ),
      ),
    );
