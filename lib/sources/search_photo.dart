import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class SearchPhoto extends StatefulWidget {
  @override
  _SearchPhotoState createState() => _SearchPhotoState();
}

class _SearchPhotoState extends State<SearchPhoto> {
  Size get s => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Search by taking a photo",
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.bolt,
                      size: hh(24),
                      color: white,
                    ),
                    Container(
                      width: hh(52),
                      height: hh(52),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: white,
                      ),
                    ),
                    Icon(
                      Icons.refresh_rounded,
                      size: hh(24),
                      color: white,
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
