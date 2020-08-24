import 'package:flutter/material.dart';
import '../widgets/headers.dart';

import 'animations_screen.dart';

class HeadersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AnimatedRectangle()),
    );
  }
}
