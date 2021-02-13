import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class VisualSearch extends StatefulWidget {
  @override
  _VisualSearchState createState() => _VisualSearchState();
}

class _VisualSearchState extends State<VisualSearch> {
  Size get s => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    print(s.width);
    return Scaffold(
      appBar: customAppBar(
        title: "Visual Search",
        ontap: () => Navigator.pop(context),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              width: s.width,
              height: s.height,
              child: Image.asset(
                "assets/images/photo.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: s.width,
              height: s.height,
              color: bg.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  padding(
                    child: Text(
                      "Search for an outfit by taking a photo or uploading an image",
                      style: TextStyle(
                        color: text,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        height: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(height: hh(30)),
                  padding(
                    child: primaryButton(s, title: "take a photo"),
                  ),
                  SizedBox(height: hh(16)),
                  padding(
                    child: outlineButton(s, title: "upload an image"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
