import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      height: s.height,
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Consumer<PromoListState>(
            builder: (context, state, child) {
              return Stack(
                children: [
                  pageLayout(
                    s,
                    ontap: () {
                      state.changePromoState();
                    },
                    function: () => pushPage(
                      CheckOut(),
                      context: context,
                    ),
                  ),
                  topBar(s),
                  promoCodeLayout(s, state: state, onpressed: () {
                    state.changePromoState();
                  }),
                ],
              );
            },
          )),
    );
  }
}

Widget promoCodeLayout(Size s, {PromoListState state, Function onpressed}) =>
    AnimatedPositioned(
      duration: Duration(milliseconds: 320),
      top: state.isOpened ? 0 : s.height,
      left: 0,
      child: Container(
        width: s.width,
        height: s.height,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 120),
              width: s.width,
              height: s.height,
              color: bg.withOpacity(0.85),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(hh(34)),
                ),
                child: Container(
                  width: s.width,
                  height: hh(464),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: hh(54)),
                            promoCodeInput(),
                            SizedBox(height: hh(32)),
                            Padding(
                              padding: EdgeInsets.only(left: ww(16)),
                              child: Text(
                                "Your Promo Codes",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: white,
                                ),
                              ),
                            ),
                            SizedBox(height: hh(18)),
                            ...List.generate(promoCodes.length, (index) {
                              return promoCodeListItem(item: promoCodes[index]);
                            }),
                            SizedBox(height: hh(83)),
                          ],
                        ),
                      ),
                      closePromoListButton(s, onpressed: onpressed),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(hh(34)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget closePromoListButton(Size s, {Function onpressed}) => Positioned(
      top: 0,
      left: 0,
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: hh(14)),
          width: s.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(34),
            ),
            color: bg,
          ),
          child: Center(
            child: Container(
              width: ww(60),
              height: hh(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: gray,
              ),
            ),
          ),
        ),
      ),
    );

Widget topBar(Size s) => Container(
      width: s.width,
      height: hh(88),
      color: bg,
      alignment: Alignment.bottomRight,
      child: IconButton(
        icon: Icon(Icons.search),
        color: white,
        onPressed: () {},
      ),
    );
Widget pageLayout(Size s, {Function ontap, Function function}) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: hh(106)),
        Padding(
          padding: EdgeInsets.only(left: ww(16)),
          child: Text(
            "My Bag",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: white,
            ),
          ),
        ),
        SizedBox(height: hh(24)),
        ...List.generate(bagItems.length, (index) {
          return bagItem(
            item: bagItems[index],
          );
        }),
        promoCodeInput(ontap: ontap),
        SizedBox(height: hh(28)),
        totalAmount(),
        SizedBox(height: hh(24)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ww(16)),
          child: primaryButton(s, title: "CHECK OUT", function: function),
        ),
        SizedBox(height: hh(83)),
      ],
    );

class PromoCodeModel {
  String discount;
  String img;
  String codeType;
  String codeTitle;
  String remainingDay;

  PromoCodeModel(
      {this.discount,
      this.img,
      this.codeType,
      this.codeTitle,
      this.remainingDay});
}

List<PromoCodeModel> promoCodes = [
  PromoCodeModel(
    discount: "10",
    img: null,
    codeType: "Personal Offer",
    codeTitle: "mypromocode2021",
    remainingDay: "6",
  ),
  PromoCodeModel(
    discount: "15",
    img: "p_code",
    codeType: "Summer Sale",
    codeTitle: "summer2021",
    remainingDay: "23",
  ),
  PromoCodeModel(
    discount: "22",
    img: null,
    codeType: "Personal Offer",
    codeTitle: "mypromocode2021",
    remainingDay: "5",
  ),
];

Widget promoCodeListItem({PromoCodeModel item}) => Container(
      margin: EdgeInsets.only(left: ww(16), right: ww(16), bottom: hh(24)),
      width: ww(343),
      height: hh(80),
      child: Row(
        children: [
          promoCodeLeft(item: item),
          promoCodeRight(item: item),
        ],
      ),
      decoration: BoxDecoration(
        color: dark,
        borderRadius: BorderRadius.circular(hh(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 1),
            blurRadius: 25,
          ),
        ],
      ),
    );

Widget promoCodeRight({PromoCodeModel item}) => Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.codeType,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
                SizedBox(height: hh(4)),
                Text(
                  item.codeTitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: white,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.remainingDay} days remaining",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: white,
                  ),
                ),
                Spacer(),
                Container(
                  width: ww(93),
                  height: hh(36),
                  child: Center(
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(36),
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(hh(8)),
            bottomRight: Radius.circular(hh(8)),
          ),
          color: dark,
        ),
      ),
    );

Widget promoCodeLeft({PromoCodeModel item}) => Container(
      width: hh(80),
      height: hh(80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "10",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: item.img == null ? white : bg,
            ),
          ),
          SizedBox(width: 4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "%",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: item.img == null ? white : bg,
                ),
              ),
              Text(
                "off",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: item.img == null ? white : bg,
                ),
              ),
            ],
          ),
        ],
      ),
      decoration: item.img == null
          ? BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(hh(8)),
                bottomLeft: Radius.circular(hh(8)),
              ),
              color: primary,
            )
          : BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(hh(8)),
                bottomLeft: Radius.circular(hh(8)),
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/images/${item.img}.png"),
                fit: BoxFit.cover,
              )),
    );

Widget promoCodeInput({Function ontap}) => GestureDetector(
      onTap: ontap,
      child: Container(
        width: ww(343),
        height: hh(36),
        margin: EdgeInsets.symmetric(horizontal: ww(16)),
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10.0, bottom: 4),
                  border: InputBorder.none,
                  hintText: "Enter your promo code",
                  hintStyle: TextStyle(
                    color: gray,
                    fontSize: 14,
                  ),
                ),
              ),
            )),
            Container(
              width: hh(36),
              height: hh(36),
              child: Icon(
                Icons.arrow_forward,
                color: bg,
              ),
              decoration: BoxDecoration(
                color: gray,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: dark,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(hh(8)),
            bottomLeft: Radius.circular(hh(8)),
            topRight: Radius.circular(hh(35)),
            bottomRight: Radius.circular(hh(35)),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 1),
              blurRadius: 8,
            )
          ],
        ),
      ),
    );

Widget totalAmount() => Container(
      width: ww(343),
      margin: EdgeInsets.symmetric(horizontal: ww(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total amount :",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: gray,
            ),
          ),
          Text(
            "124\$",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: white,
            ),
          ),
        ],
      ),
    );

class BagItemModel {
  String img;
  String product;
  String color;
  String size;
  String price;
  String count;

  BagItemModel(
      {this.img, this.product, this.color, this.size, this.price, this.count});
}

List<BagItemModel> bagItems = [
  BagItemModel(
    img: "1",
    product: "Pullover",
    color: "Black",
    size: "L",
    price: "51",
    count: "1",
  ),
  BagItemModel(
    img: "2",
    product: "T-shirt",
    color: "Gray",
    size: "M",
    price: "30",
    count: "1",
  ),
  BagItemModel(
    img: "3",
    product: "Sport Dress",
    color: "Black",
    size: "S",
    price: "43",
    count: "1",
  ),
];

Widget bagItem({BagItemModel item}) => Container(
      margin: EdgeInsets.only(left: ww(16), right: ww(16), bottom: hh(24)),
      width: ww(343),
      height: hh(104),
      decoration: BoxDecoration(
          color: dark,
          borderRadius: BorderRadius.circular(hh(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 1),
              blurRadius: 25,
            ),
          ]),
      child: Row(
        children: [
          bagItemLeft(item: item),
          bagItemRight(item: item),
        ],
      ),
    );

Widget bagItemLeft({BagItemModel item}) => Container(
      width: hh(104),
      height: hh(104),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/images/w_top_${item.img}.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(hh(8)),
          bottomLeft: Radius.circular(hh(8)),
        ),
      ),
    );

Widget bagItemRight({BagItemModel item}) => Expanded(
      child: Container(
        height: hh(104),
        padding: EdgeInsets.all(hh(10)),
        decoration: BoxDecoration(
          color: dark,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(hh(8)),
            bottomRight: Radius.circular(hh(8)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.product,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: white,
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: gray,
                ),
              ],
            ),
            SizedBox(height: hh(4)),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                    children: [
                      TextSpan(
                        text: "Color:",
                        style: TextStyle(
                          color: gray,
                        ),
                      ),
                      TextSpan(
                        text: " ${item.color}",
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: ww(13)),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                    children: [
                      TextSpan(
                        text: "Size:",
                        style: TextStyle(
                          color: gray,
                        ),
                      ),
                      TextSpan(
                        text: " ${item.size}",
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ww(109),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: hh(36),
                        height: hh(36),
                        child: Icon(
                          Icons.remove,
                          color: gray,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: dark,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff121212).withOpacity(0.39),
                              offset: Offset(0, 4),
                              blurRadius: 12,
                            )
                          ],
                        ),
                      ),
                      Text(
                        item.count,
                        style: TextStyle(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: hh(36),
                        height: hh(36),
                        child: Icon(
                          Icons.add,
                          color: gray,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: dark,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff121212).withOpacity(0.39),
                              offset: Offset(0, 4),
                              blurRadius: 12,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  item.price + "\$",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
