import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  PageController pageCtrl = PageController();
  bool openedList = false;
  bool openedListinList = false;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
        width: s.width,
        height: s.height,
        child: Consumer<CategoryPageState>(
          builder: (context, state, child) {
            return Stack(
              children: [
                !openedList && !openedListinList
                    ? PageView(
                        controller: pageCtrl,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          CategoryWomen(
                            ontap: () {
                              setState(() {
                                openedList = !openedList;
                              });
                            },
                          ),
                          CategoryMen(),
                          CategoryKids(),
                        ],
                      )
                    : openedList && !openedListinList
                        ? ChooseCategory(
                            ontap: () {
                              setState(() {
                                openedListinList = !openedListinList;
                              });
                            },
                          )
                        : ListLayout(),
                customAppbar(
                  s,
                  context: context,
                  state: state,
                  pageCtrl: pageCtrl,
                  openedList: openedList,
                  onBack: () {
                    if (openedList && !openedListinList) {
                      setState(() {
                        openedList = !openedList;
                      });
                    } else if (openedList && openedListinList) {
                      setState(() {
                        openedListinList = !openedListinList;
                      });
                    }
                  },
                ),
              ],
            );
          },
        ));
  }
}
