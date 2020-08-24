import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRectangle(),
      ),
    );
  }
}

class AnimatedRectangle extends StatefulWidget {
  @override
  _AnimatedRectangleState createState() => _AnimatedRectangleState();
}

class _AnimatedRectangleState extends State<AnimatedRectangle>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;
  Animation<double> opacity;
  Animation<double> opacityOut;
  Animation<double> moveRight;
  Animation<double> makeBigger;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    rotation = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut));
    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.25, curve: Curves.easeInCirc )),);
    moveRight = Tween(begin: 0.0, end: 40.0).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut),);
    makeBigger = Tween(begin: 0.2, end: 2.0).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut),);
    opacityOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.95,1),),);
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    print('rotation.value ${rotation.value}');
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: makeBigger.value,
          child: Transform.translate(
            offset: Offset(moveRight.value,0),
            child: Transform.rotate(
              angle: rotation.value,
              child: Opacity(
                child: Opacity(
                  child: _Rectangle(),
                  opacity: opacityOut.value,
                ),
                opacity: opacity.value,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
