import 'package:flutter/material.dart';

class CurrPage with ChangeNotifier {
  /*
    0: home
    1: problems
    2: competitions
    3: discuss
    4: store
    5: login
  */
  late int _curr;
  late int _hover;

  CurrPage() {
    _curr = 0;
    _hover = -1;
  }

  get currPage => _curr;
  get hoverPage => _hover;

  void changePage(int t) {
    _curr = t;
    notifyListeners();
  }

  void mouseChange(int t) {
    _hover = t;
    notifyListeners();
  }
}

class SeverAddress {
  final String addr = "http://localhost:5000";
}
