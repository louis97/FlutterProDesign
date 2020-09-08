import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professionalDesignsFlutter/challenges/animated_square_screen.dart';
// import 'package:professionalDesignsFlutter/lab/slideshow_screen.dart';
import '../screens/slideshow_screen.dart';
import 'package:professionalDesignsFlutter/screens/circular_graphs_screen.dart';
import 'package:professionalDesignsFlutter/screens/emergency_screen.dart';
import 'package:professionalDesignsFlutter/screens/headers_screen.dart';
import 'package:professionalDesignsFlutter/screens/printerest_screen.dart';
import 'package:professionalDesignsFlutter/screens/slider_list_screen.dart';

final screenRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'SlideShow', SlideshowScreen()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyScreen()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeadersScreen()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadrado animado',
      AnimatedRectangleScreen()),
  _Route(
      FontAwesomeIcons.circleNotch, 'Barra progreso', CircularGraphsScreen()),
  _Route(
      FontAwesomeIcons.pinterest, 'Pinterest', PrinterestScreen()),
  _Route(FontAwesomeIcons.mobile, 'Sliver', SliverListScreen()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget screen;

  _Route(this.icon, this.title, this.screen);
}
