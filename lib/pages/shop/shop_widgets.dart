import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget oppinion(Size s, {String header, String title}) => Container(
      margin: EdgeInsets.only(bottom: hh(16)),
      height: hh(100),
      width: s.width,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(hh(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            header,
            style: TextStyle(
              fontSize: hh(26),
              fontWeight: FontWeight.w600,
              color: white,
            ),
          ),
          SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: hh(14),
              fontWeight: FontWeight.w500,
              color: white,
            ),
          ),
        ],
      ),
    );

class CategoryModel {
  final String title;
  final String img;

  CategoryModel({this.title, this.img});
}

Widget category(Size s,
        {BuildContext context, CategoryModel model, Function ontap}) =>
    GestureDetector(
      onTap: ontap,
      child: Container(
        height: hh(100),
        width: s.width,
        margin: EdgeInsets.only(bottom: hh(16)),
        decoration: BoxDecoration(
          color: dark,
          borderRadius: BorderRadius.circular(hh(8)),
        ),
        child: Row(
          children: [
            Container(
              height: hh(100),
              width: (s.width - ww(32)) / 2,
              padding: EdgeInsets.only(left: ww(17)),
              alignment: Alignment.centerLeft,
              child: Text(
                model.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
            ),
            Container(
              height: hh(100),
              width: (s.width - ww(32)) / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(hh(8)),
                  bottomRight: Radius.circular(hh(8)),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/images/${model.img}.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );

List<CategoryModel> womenCategories = [
  CategoryModel(title: "New", img: "cat_new"),
  CategoryModel(title: "Clothes", img: "cat_clothes"),
  CategoryModel(title: "Shoes", img: "cat_shoes"),
  CategoryModel(title: "Accesories", img: "cat_accesories"),
];

List<CategoryModel> menCategories = [
  CategoryModel(title: "New", img: "cat_new"),
  CategoryModel(title: "Clothes", img: "cat_clothes"),
  CategoryModel(title: "Shoes", img: "cat_shoes"),
  CategoryModel(title: "Accesories", img: "cat_accesories"),
];

List<CategoryModel> kidsCategories = [
  CategoryModel(title: "New", img: "cat_new"),
  CategoryModel(title: "Clothes", img: "cat_clothes"),
  CategoryModel(title: "Shoes", img: "cat_shoes"),
  CategoryModel(title: "Accesories", img: "cat_accesories"),
];

//? Category Tabbar
class CategoryTabItemModel {
  String title;
  int idx;

  CategoryTabItemModel({this.title, this.idx});
}

List<CategoryTabItemModel> categories = [
  CategoryTabItemModel(title: "Women", idx: 0),
  CategoryTabItemModel(title: "Men", idx: 1),
  CategoryTabItemModel(title: "Kids", idx: 2),
];

Widget categoryTabItem(Size s,
        {CategoryTabItemModel item, Function ontap, bool isSelected}) =>
    GestureDetector(
      onTap: ontap,
      child: Container(
        width: s.width / 3,
        child: Center(
          child: Text(
            item.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? text : gray,
            ),
          ),
        ),
        decoration: BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(
              color: isSelected ? primary : Colors.transparent,
              width: hh(3),
            ),
          ),
        ),
      ),
    );

//? Cutom Appbar
Widget customAppbar(Size s,
        {BuildContext context,
        CategoryPageState state,
        PageController pageCtrl,
        bool openedList = false,
        Function onBack}) =>
    Container(
      width: s.width,
      height: openedList ? hh(88) : hh(132),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: bg,
        boxShadow: [
          BoxShadow(
            color: Color(0xff1A1B20),
            offset: Offset(0, hh(4)),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: openedList
                ? hh(88) - MediaQuery.of(context).padding.top
                : hh(132) - hh(44) - MediaQuery.of(context).padding.top,
            width: s.width,
            child: Material(
              color: bg,
              shadowColor: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  openedList
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: onBack,
                          color: white,
                        )
                      : Container(width: 48),
                  Text(
                    "Categories",
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                    color: white,
                  ),
                ],
              ),
            ),
          ),
          openedList
              ? Container()
              : catTabbar(s, state: state, pageCtrl: pageCtrl)
        ],
      ),
    );

Widget catTabbar(Size s, {CategoryPageState state, PageController pageCtrl}) =>
    Container(
      width: s.width,
      height: hh(44),
      child: Row(
        children: List.generate(categories.length, (index) {
          return categoryTabItem(
            s,
            item: categories[index],
            isSelected: index == state.page,
            ontap: () {
              state.changePage(categories[index].idx);
              pageCtrl.animateToPage(
                state.page,
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 360),
              );
            },
          );
        }),
      ),
    );
