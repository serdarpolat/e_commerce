import 'package:flutter/cupertino.dart';

class PageState with ChangeNotifier {
  int _page = 0;
  int get page => _page;

  changePage(int page) {
    _page = page;
    notifyListeners();
  }
}

class CategoryPageState with ChangeNotifier {
  int _page = 0;
  int get page => _page;

  changePage(int page) {
    _page = page;
    notifyListeners();
  }
}
