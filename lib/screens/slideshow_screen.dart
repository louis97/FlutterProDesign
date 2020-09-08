import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/slideshow.dart';

class SlideshowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge = (MediaQuery.of(context).size.height > 500) ? true : false;
    final List<Widget> children = [
      Expanded(child: My_Slideshow()),
      Expanded(child: My_Slideshow())
    ];
    return Scaffold(
      // backgroundColor: Colors.purple,
      body: (isLarge) ? Column(children: children) : Row(children: children),
    );
  }
}

class My_Slideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slideshow(
      // dotsUp: true,
      primaryBullet: 14,
      secondaryBullet: 10,
      primaryColor: Colors.pink,
      secondaryColor: Colors.grey,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
      ],
    );
  }
}
