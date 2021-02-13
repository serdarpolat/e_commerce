import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class CropPhoto extends StatefulWidget {
  @override
  _CropPhotoState createState() => _CropPhotoState();
}

class _CropPhotoState extends State<CropPhoto> {
  Size get s => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Crop the item",
        ontap: () => Navigator.pop(context),
      ),
      body: Container(
        width: s.width,
        height: s.height,
        child: Column(
          children: [
            Container(
              width: s.width,
              height: hh(618),
              child: Image.asset(
                "assets/images/search_photo.png",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                color: bg,
                child: Center(
                  child: Container(
                    width: hh(52),
                    height: hh(52),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.search,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
