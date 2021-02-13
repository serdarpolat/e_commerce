import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SliderItemModel {
  final String image;
  final double likeCount;
  final String brand;
  final String product;
  final double price;
  final double discount;

  SliderItemModel(
      {this.image,
      this.likeCount,
      this.brand,
      this.product,
      this.price,
      this.discount});
}

List<SliderItemModel> newItems = [
  SliderItemModel(
      image: "item1.png",
      likeCount: 6.4,
      brand: "OVS",
      product: "Blouse",
      price: 30),
  SliderItemModel(
      image: "item2.png",
      likeCount: 5.3,
      brand: "Mango Boy",
      product: "T-Shirt Sailing",
      price: 10),
  SliderItemModel(
      image: "item3.png",
      likeCount: 8.7,
      brand: "Dorothy Perkins",
      product: "Evening Dress",
      price: 12),
];

List<SliderItemModel> discountItems = [
  SliderItemModel(
    image: "item3.png",
    likeCount: 9,
    brand: "Dorothy Perkins",
    product: "Evening Dress",
    price: 15,
    discount: 20,
  ),
  SliderItemModel(
    image: "item4.png",
    likeCount: 8,
    brand: "Sitlly",
    product: "Sport Dress",
    price: 22,
    discount: 15,
  ),
  SliderItemModel(
    image: "item5.png",
    likeCount: 9.6,
    brand: "Dorothy Perkins",
    product: "Sport Dress",
    price: 14,
    discount: 20,
  ),
];

class SliderItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<SliderItemModel> items;
  final List<SliderItemModel> sales;

  const SliderItem({Key key, this.title, this.subtitle, this.items, this.sales})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sliderItemHeader(
            title: title,
            subtitle: subtitle,
          ),
          SizedBox(height: hh(22)),
          Container(
            width: s.width,
            height: hh(276),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: ww(14)),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemImage(
                      item: items[index],
                      color: items[index].discount == null ? bg : primary,
                      btnTitle: items[index].discount == null
                          ? "NEW"
                          : "-" + items[index].discount.toString() + "%",
                    ),
                    SizedBox(height: hh(5)),
                    ratingBar(item: items[index]),
                    SizedBox(height: hh(5)),
                    brand(item: items[index]),
                    SizedBox(height: hh(5)),
                    product(item: items[index]),
                    SizedBox(height: hh(5)),
                    items[index].discount == null
                        ? price(item: items[index])
                        : discount(item: items[index]),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget itemImage({SliderItemModel item, Color color, String btnTitle}) =>
    Padding(
      padding: EdgeInsets.only(right: ww(14)),
      child: Container(
        width: ww(148),
        height: hh(184),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            smallButton(
              color: color,
              title: btnTitle,
            ),
            Positioned(
              right: 0,
              bottom: -(ww(36) / 2),
              child: likeButton(color: bg),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/images/${item.image}",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

Widget ratingBar({SliderItemModel item}) => RatingBar.builder(
      initialRating: item.likeCount / 2,
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
        print(rating);
      },
    );

Widget brand({SliderItemModel item}) => Text(
      item.brand,
      style: TextStyle(
        color: gray,
        fontSize: hh(12),
      ),
    );

Widget product({SliderItemModel item}) => Text(
      item.product,
      style: TextStyle(
        color: text,
        fontSize: hh(16),
        fontWeight: FontWeight.w600,
      ),
    );

Widget price({SliderItemModel item}) => Text(
      item.price.toString() + "\$",
      style: TextStyle(
        color: white,
        fontSize: hh(14),
        fontWeight: FontWeight.w500,
      ),
    );

Widget discount({SliderItemModel item}) => Row(
      children: [
        Text(
          item.price.toString() + "\$",
          style: TextStyle(
            color: gray,
            fontSize: hh(14),
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        SizedBox(width: ww(4)),
        Text(
          (item.price * (100 - item.discount) / 100).toString() + "\$",
          style: TextStyle(
            color: primary,
            fontSize: hh(14),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
