import 'package:flutter/material.dart';
import '../widgets/fat_button.dart';
import '../widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class _ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  _ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge = (MediaQuery.of(context).size.height > 500) ? true : false;
    final items = <_ItemBoton>[
      _ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      _ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      _ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      _ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      _ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      _ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      _ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      _ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      _ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> fatButtons = items
        .map((e) => FadeInLeft(
              child: FatButton(
                icon: e.icon,
                texto: e.texto,
                color1: e.color1,
                color2: e.color2,
                onpress: () {
                  print('hola');
                },
              ),
            ))
        .toList();

    return Scaffold(
        body: Stack(
      children: <Widget>[
        ButtonList(fatButtons: fatButtons),
        if (isLarge) Header(),
      ],
    ));
  }
}

class ButtonList extends StatelessWidget {
  const ButtonList({
    @required this.fatButtons,
  });

  final List<Widget> fatButtons;

  @override
  Widget build(BuildContext context) {
    bool isLarge = (MediaQuery.of(context).size.height > 500) ? true : false;
    return Container(
      margin: EdgeInsets.only(top: isLarge ? 220 : 10),
      child: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            if (isLarge)
              SizedBox(
                height: 80,
              ),
            ...fatButtons
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icono: FontAwesomeIcons.plus,
          titulo: 'Titulo',
          subtitulo: 'Subtitulo',
          color2: Color(0xff66A9F2),
          color1: Color(0xff536CF6),
        ),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
                padding: EdgeInsets.all(15),
                onPressed: () {
                  print('RawMaterialButton clicked');
                },
                shape: CircleBorder(),
                child: FaIcon(
                  FontAwesomeIcons.ellipsisV,
                  color: Colors.white,
                ))),
      ],
    );
  }
}

// class _PageHeader extends StatelessWidget {
//   const _PageHeader({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IconHeader(
//       icono: FontAwesomeIcons.plus,
//       titulo: 'Tilulo',
//       subtitulo: 'Subtitulo',
//       color1: Color(0xff526bf6),
//       color2: Color(0xff67acf2),
//     );
//   }
// }
