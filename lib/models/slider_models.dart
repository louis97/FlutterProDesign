import 'package:flutter/cupertino.dart';

class SliderModel with ChangeNotifier {
  double _currentPage;

  double get currentPage => _currentPage;
  set currentPage(double cp) {
    this._currentPage = cp;
    notifyListeners();
  }
}
