import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("Payment Methods"),
          backgroundColor: bg,
        ),
        body: Consumer<AddCardState>(
          builder: (BuildContext context, state, Widget child) {
            return Container(
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
                        SizedBox(height: hh(31)),
                        padding(
                          child: Text(
                            "Your payment cards",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: white,
                            ),
                          ),
                        ),
                        SizedBox(height: hh(21)),
                        padding(
                          child: GestureDetector(
                            onTap: () =>
                                pushPage(Successed(), context: context),
                            child: paymentCard(
                                img: "card_bg1",
                                name: "Jane Doe",
                                date: "05/23"),
                          ),
                        ),
                        SizedBox(height: hh(40)),
                        GestureDetector(
                          onTap: () => pushPage(Successed(), context: context),
                          child: padding(
                            child: paymentCard(
                                img: "card_bg2",
                                name: "Jane Doe",
                                date: "05/23"),
                          ),
                        ),
                        SizedBox(height: hh(40)),
                        padding(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  state.changeAddCardState();
                                },
                                child: Container(
                                  width: hh(36),
                                  height: hh(36),
                                  child: Icon(Icons.add, color: bg),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 320),
                    left: 0,
                    top: state.isOpened ? 0 : s.height,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 120),
                      width: s.width,
                      height: s.height,
                      color: bg.withOpacity(state.isOpened ? 0.8 : 0.0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: s.width,
                              height: hh(572 + 36.0),
                              child: Stack(
                                children: [
                                  Container(
                                    width: s.width,
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Column(
                                        children: [
                                          SizedBox(height: hh(50)),
                                          Text(
                                            "Add new card",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: white,
                                            ),
                                          ),
                                          SizedBox(height: hh(20)),
                                          padding(
                                            child: textField(s, "Password",
                                                isActive: false,
                                                obsecureText: true,
                                                keyboardType:
                                                    TextInputType.text),
                                          ),
                                          SizedBox(height: hh(20)),
                                          padding(
                                            child: textField(s, "Card number",
                                                isActive: false,
                                                obsecureText: true,
                                                keyboardType:
                                                    TextInputType.text),
                                          ),
                                          SizedBox(height: hh(20)),
                                          padding(
                                            child: textField(s, "Expiry date",
                                                isActive: false,
                                                obsecureText: true,
                                                keyboardType:
                                                    TextInputType.text),
                                          ),
                                          SizedBox(height: hh(20)),
                                          padding(
                                            child: textField(s, "CVV",
                                                isActive: false,
                                                obsecureText: true,
                                                keyboardType:
                                                    TextInputType.text),
                                          ),
                                          SizedBox(height: hh(20)),
                                          padding(
                                              child: primaryButton(s,
                                                  title: "ADD CARD")),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      state.changeAddCardState();
                                    },
                                    child: Container(
                                      width: s.width,
                                      height: hh(34),
                                      child: Center(
                                        child: Container(
                                          width: ww(60),
                                          height: hh(6),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
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
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: bg,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(hh(34)),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0, -4),
                                    blurRadius: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

Widget paymentCard({
  String img,
  String name,
  String date,
}) =>
    Container(
      width: ww(343),
      height: hh(216),
      padding: EdgeInsets.only(
          bottom: hh(24), left: ww(24), right: ww(24), top: hh(87.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "* * * *  * * * *  * * * *  3947",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: white,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Card Holder Name",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: gray,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: white,
                    ),
                  ),
                ],
              ),
              SizedBox(width: ww(66)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Expiry Date",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: gray,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(hh(8)),
        image: DecorationImage(
          image: AssetImage("assets/images/images/$img.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
