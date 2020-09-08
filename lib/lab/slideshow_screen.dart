import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/slider_models.dart';
import 'package:provider/provider.dart';

class SlideShowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return SliderModel();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[Expanded(child: _Slides()), _Dots()],
          ),
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      // print(pageController.page);
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageController.page;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(controller: pageController, children: <Widget>[
        _Slide('assets/svgs/slide-2.svg'),
        _Slide('assets/svgs/slide-3.svg'),
        _Slide('assets/svgs/slide-4.svg'),
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  var svg;

  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SvgPicture.asset(svg),
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(30));
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_Dot(0), _Dot(1), _Dot(2)],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  int index;
  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 12,
      width: 12,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: (pageViewIndex != null &&
                  pageViewIndex >= index - 0.5 &&
                  pageViewIndex < index + 0.5)
              ? Colors.blue
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}
