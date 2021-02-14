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

class ListGridState with ChangeNotifier {
  String _listType = "list";

  String get listType => _listType;

  changeType(String listType) {
    _listType = listType;
    notifyListeners();
  }
}

class PromoListState with ChangeNotifier {
  bool _isOpened = false;

  bool get isOpened => _isOpened;

  changePromoState() {
    _isOpened = !_isOpened;
    notifyListeners();
  }
}
