import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  final PageController pageCtrl;

  const Navbar({Key key, this.pageCtrl}) : super(key: key);
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  Size get s => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: s.width,
        height: hh(83),
        child: Row(
          children: List.generate(
            navItems.length,
            (index) {
              return navItem(
                s,
                item: navItems[index],
                ontap: () {
                  final state = Provider.of<PageState>(context);
                  navItems.forEach((e) {
                    e.status = false;
                  });
                  setState(() {
                    navItems[index].status = true;
                  });
                  state.changePage(navItems[index].idx);
                  widget.pageCtrl.animateToPage(
                    navItems[index].idx,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 360),
                  );
                },
              );
            },
          ),
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff1A1B20),
              offset: Offset(0, -hh(4)),
              blurRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class NavItemModel {
  String icon;
  String iconAlt;
  String title;
  int idx;
  bool status;

  NavItemModel({this.icon, this.iconAlt, this.title, this.idx, this.status});
}

List<NavItemModel> navItems = [
  NavItemModel(
      icon: "home", iconAlt: "home_alt", title: "Home", idx: 0, status: true),
  NavItemModel(
      icon: "cart", iconAlt: "cart_alt", title: "Shop", idx: 1, status: false),
  NavItemModel(
      icon: "bag", iconAlt: "bag_alt", title: "Bag", idx: 2, status: false),
  NavItemModel(
      icon: "heart",
      iconAlt: "heart_alt",
      title: "Favorites",
      idx: 3,
      status: false),
  NavItemModel(
      icon: "account",
      iconAlt: "account_alt",
      title: "Profile",
      idx: 4,
      status: false),
];

Widget navItem(Size s, {NavItemModel item, Function ontap}) => GestureDetector(
      onTap: ontap,
      child: Container(
        width: s.width / 5,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.only(
            topRight: item.idx == 4 ? Radius.circular(12) : Radius.circular(0),
            topLeft: item.idx == 0 ? Radius.circular(12) : Radius.circular(0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              item.status
                  ? "assets/images/icons/${item.icon}.png"
                  : "assets/images/icons/${item.iconAlt}.png",
              height: hh(24),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              item.title,
              style: TextStyle(
                color: item.status ? primary : gray,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
