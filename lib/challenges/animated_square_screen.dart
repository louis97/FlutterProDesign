import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedRectangleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> moveRight;
  Animation<double> moveUp;
  Animation<double> moveLeft;
  Animation<double> moveDown;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500~/4));
    moveRight = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(curve: Interval(0.0, 0.25, curve: Curves.bounceInOut), parent: controller));
    moveUp = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(curve: Interval(0.25, 0.50, curve: Curves.bounceInOut), parent: controller));
    moveLeft = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(curve: Interval(0.5, 0.75, curve: Curves.bounceInOut), parent: controller));
    moveDown = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(curve: Interval(0.75, 1, curve: Curves.bounceInOut), parent: controller));

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          child: AnimatedSquare(),
          animation: controller,
          builder: (context, child) {
            return Transform.translate(
              child: Transform.translate(
                child: Transform.translate(
                  child: Transform.translate(
                    child: _Rectangle(),
                    offset: Offset(moveRight.value, 0),
                  ),
                  offset: Offset(0, moveUp.value),
                ),
                offset: Offset(-moveLeft.value, 0),
              ),
              offset: Offset(0, -moveDown.value),
            );
          },
        ),
      ),
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
