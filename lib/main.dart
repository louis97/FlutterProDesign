import 'package:flutter/material.dart';
// import './screens/circular_graphs_screen.dart';
// import './screens/slideshow_screen.dart';
// import './screens/printerest_screen.dart';
import './screens/emergency_screen.dart';
import './screens/slider_list_screen.dart';


void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SliverListScreen(),
    );
  }
}


