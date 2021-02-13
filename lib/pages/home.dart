import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size get s => MediaQuery.of(context).size;
  PageController pageCtrl = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Container(
          width: s.width,
          height: s.height,
          child: Consumer<PageState>(
            builder: (BuildContext context, value, Widget child) {
              return Stack(
                children: [
                  PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageCtrl,
                    itemCount: pages.length,
                    itemBuilder: (context, index) {
                      return pages[index];
                    },
                  ),
                  Navbar(
                    pageCtrl: pageCtrl,
                  ),
                ],
              );
            },
          )),
    );
  }
}

List<Widget> pages = [
  MainPage(),
  ShopPage(),
  BagPage(),
  FavoritesPage(),
  ProfilePage(),
];
