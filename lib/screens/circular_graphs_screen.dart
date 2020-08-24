import 'package:flutter/material.dart';
import '../widgets/radial_progress.dart';

class CircularGraphsScreen extends StatefulWidget {
  CircularGraphsScreen({Key key}) : super(key: key);

  @override
  _CircularGraphsScreenState createState() => _CircularGraphsScreenState();
}

class _CircularGraphsScreenState extends State<CircularGraphsScreen> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.refresh),
          onPressed: () {
            percentage += 10;
            if (percentage > 100) {
              percentage = 0;
            }
            setState(() {});
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomRadialProgress(percentage: percentage, color: Colors.red),
                CustomRadialProgress(percentage: percentage, color: Colors.pink),
              ],
            ),
            Row(
              children: <Widget>[
                CustomRadialProgress(percentage: percentage, color: Colors.purple),
                CustomRadialProgress(percentage: percentage, color: Colors.blue),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  final double percentage;

  const CustomRadialProgress({@required this.color, @required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: 180,
        child: RadialProgress(
            percentage: this.percentage,
            primaryColor: this.color,
            secondaryColor: Colors.grey,
            strokeWidth: 4.0,
            strokeWidth2: 8.0));
  }
}
