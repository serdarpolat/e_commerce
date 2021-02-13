import 'package:e_commerce/sources/index.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  Size get s => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        width: s.width,
        height: s.height,
        color: bg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: hh(62),
              color: primary,
            ),
            SizedBox(height: hh(13)),
            padding(
              child: Text(
                "Finding similar results...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  color: white,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
