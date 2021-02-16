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
  bool sortBy = false;

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
                        : ListLayout(
                            openSort: () {
                              setState(() {
                                sortBy = !sortBy;
                              });
                            },
                          ),
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
                AnimatedPositioned(
                  duration: Duration(milliseconds: 320),
                  top: sortBy ? 0 : s.height,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 120),
                    width: s.width,
                    height: s.height,
                    color: dark.withOpacity(sortBy ? 0.75 : 0.0),
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: s.width,
                      height: hh(456),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sortBy = !sortBy;
                              });
                            },
                            child: Container(
                              width: s.width,
                              height: hh(34),
                              child: Center(
                                child: Container(
                                  width: ww(60),
                                  height: hh(6),
                                  decoration: BoxDecoration(
                                    color: gray,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(hh(34)),
                                ),
                                color: bg,
                              ),
                            ),
                          ),
                          SizedBox(height: hh(16)),
                          Text(
                            "Sort by",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: white,
                            ),
                          ),
                          SizedBox(height: hh(36)),
                          sortItem(s, "Popular", false),
                          sortItem(s, "Newest", false),
                          sortItem(s, "Customer review", false),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  sortBy = !sortBy;
                                });
                              },
                              child:
                                  sortItem(s, "Price: lowest to high", true)),
                          sortItem(s, "Price: highest to low", false),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(hh(34))),
                        color: bg,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            offset: Offset(0, -4),
                            blurRadius: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

Widget sortItem(Size s, String title, bool selected) => Container(
      width: s.width,
      height: hh(46),
      color: selected ? primary : bg,
      child: Padding(
        padding: EdgeInsets.all(ww(16)),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? bg : white,
            fontSize: 18,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
