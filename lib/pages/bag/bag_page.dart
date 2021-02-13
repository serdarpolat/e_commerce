import 'package:flutter/material.dart';

class BagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Text("Bag page"),
          ],
        ),
      ),
    );
  }
}
