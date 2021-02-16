import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool changePass = false;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bg,
        actions: [
          IconButton(icon: Icon(Icons.search), color: white, onPressed: () {})
        ],
      ),
      body: Container(
        width: s.width,
        height: s.height,
        color: bg,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: hh(25)),
                padding(
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                    ),
                  ),
                ),
                SizedBox(height: hh(23)),
                padding(
                  child: Text(
                    "Personal information",
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: hh(22)),
                padding(
                  child: textField(
                    s,
                    "Full name",
                    isActive: false,
                    obsecureText: false,
                  ),
                ),
                SizedBox(height: hh(22)),
                padding(
                  child: textField(
                    s,
                    "Date of Birth",
                    isActive: false,
                    obsecureText: false,
                  ),
                ),
                SizedBox(height: hh(54)),
                padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            changePass = !changePass;
                          });
                        },
                        child: Text(
                          "Change",
                          style: TextStyle(
                            color: primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: hh(10)),
                padding(
                  child: textField(
                    s,
                    "Password",
                    isActive: false,
                    obsecureText: true,
                  ),
                ),
                SizedBox(height: hh(54)),
                padding(
                  child: Text(
                    "Notifications",
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: hh(23)),
                checkBox(title: "Sales", isSelected: true),
                SizedBox(height: hh(23)),
                checkBox(title: "New arrivals", isSelected: false),
                SizedBox(height: hh(23)),
                checkBox(title: "Delivery status changes", isSelected: false),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 320),
              top: changePass ? 0 : s.height,
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
                      color: bg.withOpacity(changePass ? 0.7 : 0.0),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: s.width,
                        height: hh(524),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: hh(14)),
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
                              SizedBox(height: hh(2)),
                              Text(
                                "Password Change",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: hh(18)),
                              padding(
                                child: textField(s, "Old Password",
                                    obsecureText: true, isActive: false),
                              ),
                              SizedBox(height: hh(6)),
                              padding(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text("Forgot Password?")),
                                ),
                              ),
                              SizedBox(height: hh(18)),
                              padding(
                                child: textField(s, "New Password",
                                    obsecureText: true, isActive: false),
                              ),
                              SizedBox(height: hh(24)),
                              padding(
                                child: textField(s, "Repeat New Password",
                                    obsecureText: true, isActive: false),
                              ),
                              SizedBox(height: hh(32)),
                              padding(
                                child: primaryButton(s, title: "SAVE PASSWORD",
                                    function: () {
                                  setState(() {
                                    changePass = !changePass;
                                  });
                                }),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(hh(34)),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
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
      ),
    );
  }
}

Widget checkBox({String title, bool isSelected}) => padding(
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
          Container(
            width: ww(33),
            height: hh(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: gray.withOpacity(0.1),
            ),
            child: Stack(
              children: [
                Align(
                  alignment:
                      isSelected ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: hh(20),
                    height: hh(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isSelected ? success : gray.withOpacity(0.2),
                      boxShadow: [
                        BoxShadow(
                          color: isSelected
                              ? Color(0xff2AA952).withOpacity(0.45)
                              : Color(0xff14151B),
                          offset: Offset(0, 0),
                          blurRadius: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
