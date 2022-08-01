import 'package:flutter/widgets.dart';

class UiProvider extends ChangeNotifier {
  int _selectMenuOpt = 0;
  String _appbarTitle = 'Popular';

  int get selectMenuOpt {
    return _selectMenuOpt;
  }

  set selectMenuOpt(int i) {
    _selectMenuOpt = i;
    notifyListeners();
  }

  String get appbarTitle {
    return _appbarTitle;
  }

  set appbarTitle(String title) {
    _appbarTitle = title;
    notifyListeners();
  }
}
