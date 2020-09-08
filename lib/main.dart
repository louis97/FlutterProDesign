import 'package:flutter/material.dart';
import './models/layout_Model.dart';
import 'package:professionalDesignsFlutter/screens/launcher_screen.dart';
import 'package:professionalDesignsFlutter/screens/launcher_screen_tablet.dart';
import 'package:professionalDesignsFlutter/screens/slideshow_screen.dart';
import 'package:professionalDesignsFlutter/theme/theme.dart';
import 'package:provider/provider.dart';
// import './screens/circular_graphs_screen.dart';
// import './screens/slideshow_screen.dart';
// import './screens/printerest_screen.dart';
import './screens/emergency_screen.dart';
import './screens/slider_list_screen.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<ThemeChanger>.value(value: ThemeChanger(2)),
      ChangeNotifierProvider<LayoutModel>.value(value: LayoutModel()),
    ], child: MyApp()));
// void main() => runApp(
//     ChangeNotifierProvider(create: (_) => ThemeChanger(1), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeChanger>(context).currentTheme,
      title: 'Flutter Demo',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('Orientation $orientation');
          Size size = MediaQuery.of(context).size;
          if (size.width > 500) {
            return LauncherScreenTablet();
          } else {
            return LauncherScreen();
          }
          // return Container(
          //   child: LauncherScreen(),
          // );
        },
      ),
      // home: SlideshowScreen(), NOT WORKING
    );
  }
}
