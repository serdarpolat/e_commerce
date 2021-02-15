import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/sources/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageState()),
        ChangeNotifierProvider(create: (_) => CategoryPageState()),
        ChangeNotifierProvider(create: (_) => ListGridState()),
        ChangeNotifierProvider(create: (_) => PromoListState()),
        ChangeNotifierProvider(create: (_) => AddCardState()),
        ChangeNotifierProvider(create: (_) => Addr1CheckBox()),
      ],
      child: MaterialApp(
        title: 'Shopper',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Metropolis",
        ),
        home: Home(),
      ),
    );
  }
}
