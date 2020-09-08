
import 'package:flutter/material.dart';
import 'package:professionalDesignsFlutter/theme/theme.dart';
import 'package:provider/provider.dart';
import '../widgets/headers.dart';

import 'animations_screen.dart';

class HeadersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme= Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      body: WaveHeader(color: appTheme.accentColor,),
    );
  }
}
