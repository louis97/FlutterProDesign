import 'package:flutter/material.dart';
import 'dart:math' as Math;

class RadialProgress extends StatefulWidget {
  double percentage;
  Color primaryColor;
  Color secondaryColor;
  double strokeWidth;
  double strokeWidth2;

  RadialProgress(
      {@required this.percentage,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.strokeWidth = 10.0,
      this.strokeWidth2 = 4.0});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  double previusPercentage;
  AnimationController controller;

  @override
  void initState() {
    previusPercentage = widget.percentage;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final differenceBtweenPercentages = widget.percentage - previusPercentage;
    previusPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10),
          child: CustomPaint(
              painter: _MyCircularProgressPainter(
                  percentage:
                      (widget.percentage - differenceBtweenPercentages) +
                          (differenceBtweenPercentages * controller.value),
                  primaryColor: widget.primaryColor,
                  secondaryColor: widget.secondaryColor,
                  strokeWidth: widget.strokeWidth,
                  strokeWidth2: widget.strokeWidth2)),
        );
      },
    );
  }
}

class _MyCircularProgressPainter extends CustomPainter {
  double percentage;
  Color primaryColor;
  Color secondaryColor;
  double strokeWidth;
  double strokeWidth2;

  _MyCircularProgressPainter(
      {this.percentage,
      this.primaryColor,
      this.secondaryColor,
      this.strokeWidth,
      this.strokeWidth2});

  @override
  void paint(Canvas canvas, Size size) {

    Rect rect= Rect.fromCircle(
      center: Offset(0,0),
      radius: 180,
    );

Gradient gradient = LinearGradient(colors: <Color>[Color(0XFFC012FF),Color(0XFF6D05E8), this.primaryColor]);

    Paint paint = Paint()
      ..color = this.secondaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = this.strokeWidth;

    final center = Offset(size.width * 0.5, size.width * 0.5);
    final radius = Math.min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);

    Paint paintArc = Paint()
      ..strokeWidth = this.strokeWidth2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      // ..color = this.primaryColor;
      ..shader = gradient.createShader(rect);
      

    double arcAngle = 2 * Math.pi * (percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        (Math.pi * 3) / 2, arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
