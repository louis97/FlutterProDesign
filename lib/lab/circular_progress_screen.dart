import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as Math;

class CircularProgressScreen extends StatefulWidget {
  @override
  _CircularProgressScreenState createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> with SingleTickerProviderStateMixin{

  double percentage=0;
  double newPercentage=0;
  AnimationController controller;

  @override
  void initState() {
    controller= AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 800)
    );
    controller.addListener(() {
      //print('listener ${controller.value}');
      setState(() {
        percentage=lerpDouble(percentage, newPercentage, controller.value);
      });
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){

          if(newPercentage==100){
            percentage=0;
            newPercentage=0;
          }else{
            newPercentage+=10;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MyCircularProgressPainter(percentage),
          )
        ),
      ),
    );
  }
}

class _MyCircularProgressPainter extends CustomPainter{

  double percentage;
  _MyCircularProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint=Paint()
        ..color=Colors.grey
        ..style=PaintingStyle.stroke
        ..strokeWidth=4;

    final center= Offset(size.width*0.5, size.width*0.5 );
    final radius= Math.min(size.width*0.5,size.height*0.5);
    canvas.drawCircle(center, radius, paint);

    Paint paintArc= Paint()
    ..strokeWidth=8
    ..style=PaintingStyle.stroke
    ..color=Colors.red;

    double arcAngle=2*Math.pi*(percentage/100);

    canvas.drawArc(Rect.fromCircle(center:center, radius: radius), (Math.pi*3)/2, arcAngle  , false, paintArc);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}
