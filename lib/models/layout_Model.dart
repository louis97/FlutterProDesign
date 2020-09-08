import 'package:flutter/cupertino.dart';
import 'package:professionalDesignsFlutter/screens/slideshow_screen.dart';

class LayoutModel with ChangeNotifier{

Widget _currentScreen = SlideshowScreen();

get currentScreen => _currentScreen;

set currentScreen (Widget cs){
  _currentScreen=cs;
  notifyListeners();
}


}