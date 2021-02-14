import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ListLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: hh(88) + ww(16),
        bottom: hh(83 - 16.0) + ww(16),
      ),
      width: s.width,
      height: s.height,
      color: bg,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Consumer<ListGridState>(
          builder: (BuildContext context, state, Widget child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(height: hh(12)),
                shortCuts(s),
                SizedBox(height: hh(36)),
                filters(
                    state: state,
                    ontap: () {
                      if (state.listType == "list") {
                        state.changeType("grid");
                      } else {
                        state.changeType("list");
                      }
                    }),
                SizedBox(height: hh(26)),
                if (state.listType == "list")
                  ...List.generate(listItems.length, (index) {
                    return listItem(listItem: listItems[index]);
                  })
                else
                  Container(
                    width: ww(343),
                    margin: EdgeInsets.symmetric(horizontal: ww(16)),
                    child: Wrap(
                      spacing: ww(15),
                      runSpacing: hh(16),
                      children: List.generate(
                        listItems.length,
                        (index) {
                          return gridItem(listItem: listItems[index]);
                        },
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget header() => Padding(
      padding: EdgeInsets.only(
        left: ww(16),
        right: ww(16),
      ),
      child: Text(
        "Women's tops",
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: white,
        ),
      ),
    );

Widget shortCuts(Size s) => Container(
      height: hh(30),
      width: s.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: ww(16)),
        physics: BouncingScrollPhysics(),
        itemCount: topbuttons.length,
        itemBuilder: (context, index) {
          return topButton(title: topbuttons[index]);
        },
      ),
    );

Widget filters({Function ontap, ListGridState state}) => Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ww(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.filter_list,
                color: white,
                size: 36,
              ),
              SizedBox(width: ww(7)),
              Text(
                "Filters",
                style: TextStyle(
                  fontSize: 14,
                  color: white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.swap_vert,
                color: white,
                size: 36,
              ),
              SizedBox(width: ww(7)),
              Text(
                "Price: lowest to high",
                style: TextStyle(
                  fontSize: 14,
                  color: white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: ontap,
            child: Icon(
              state.listType == "list" ? Icons.view_module : Icons.list,
              color: white,
              size: 36,
            ),
          ),
        ],
      ),
    );

List<String> topbuttons = [
  "T-shirts",
  "Crop tops",
  "Sleeveless",
  "Blouses",
  "Shirts",
];

Widget topButton({String title}) => Container(
      padding: EdgeInsets.symmetric(horizontal: ww(20)),
      margin: EdgeInsets.only(right: ww(10)),
      height: hh(30),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

class ListItemModel {
  String img;
  String product;
  String brand;
  double like;
  double price;

  ListItemModel({this.img, this.product, this.brand, this.like, this.price});
}

List<ListItemModel> listItems = [
  ListItemModel(
    img: "1",
    product: "Pullover",
    brand: "Mango",
    like: 4.2,
    price: 51,
  ),
  ListItemModel(
    img: "2",
    product: "Blouse",
    brand: "Dorothy Perkins",
    like: 0,
    price: 34,
  ),
  ListItemModel(
    img: "3",
    product: "T-shirt",
    brand: "LOST Ink",
    like: 5,
    price: 12,
  ),
  ListItemModel(
    img: "4",
    product: "Shirt",
    brand: "Topshop",
    like: 3,
    price: 51,
  ),
];

Widget gridItem({ListItemModel listItem}) => Container(
      width: ww(164),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: ww(164),
            height: hh(184),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ww(8)),
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/images/w_top_${listItem.img}.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: hh(7)),
          RatingBar.builder(
            initialRating: listItem.like,
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
          ),
          SizedBox(height: hh(6)),
          Text(
            listItem.brand,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: gray,
            ),
          ),
          SizedBox(height: hh(5)),
          Text(
            listItem.product,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: white,
            ),
          ),
          SizedBox(height: hh(4)),
          Text(
            "${listItem.price}\$",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: white,
            ),
          ),
        ],
      ),
    );

Widget listItem({ListItemModel listItem}) => Padding(
      padding: EdgeInsets.only(left: ww(16), right: ww(16), bottom: hh(32)),
      child: Container(
        width: ww(343),
        height: hh(104),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, hh(1)),
              blurRadius: 24,
            ),
          ],
          borderRadius: BorderRadius.circular(hh(8)),
          color: dark,
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Row(
              children: [
                Container(
                  width: hh(104),
                  height: hh(104),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(hh(8)),
                      bottomLeft: Radius.circular(hh(8)),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/images/w_top_${listItem.img}.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: hh(104),
                    padding: EdgeInsets.all(hh(11)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listItem.product,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
                        SizedBox(height: hh(4)),
                        Text(
                          listItem.brand,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: gray,
                          ),
                        ),
                        SizedBox(height: hh(8)),
                        RatingBar.builder(
                          initialRating: listItem.like,
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
                        ),
                        Spacer(),
                        Text(
                          "${listItem.price}\$",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          offset: Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(hh(8)),
                        bottomRight: Radius.circular(hh(8)),
                      ),
                      color: dark,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: -18,
              child: likeButton(color: bg),
            ),
          ],
        ),
      ),
    );
