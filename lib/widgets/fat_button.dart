import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onpress;

  const FatButton(
      {this.icon = FontAwesomeIcons.circle,
      @required this.texto,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,
      @required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _FatButtonBackground(this.icon, this.color1, this.color2, this.onpress),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 140,
            width: 40,
          ),
          FaIcon(
            this.icon,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              this.texto,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
          SizedBox(
            width: 70,
          ),
        ],
      )
    ]);
  }
}

class _FatButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;
  final Function onPress;

  const _FatButtonBackground(this.icon, this.color1, this.color2, this.onPress);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Positioned(
                  right: -20,
                  top: -20,
                  child: FaIcon(
                    this.icon,
                    color: Colors.white.withOpacity(0.2),
                    size: 150,
                  ))
            ],
          ),
        ),
        width: double.infinity,
        height: 100,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(4, 6),
                  blurRadius: 10)
            ],
            gradient:
                LinearGradient(colors: <Color>[this.color1, this.color2])),
      ),
    );
  }
}
