import 'package:flutter/material.dart';
import 'package:professionalDesignsFlutter/theme/theme.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  List<Widget> slides;
  bool dotsUp;
  Color primaryColor;
  Color secondaryColor;
  double primaryBullet;
  double secondaryBullet;
  Slideshow(
      {@required this.slides,
      this.dotsUp = false,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.primaryBullet = 12,
      this.secondaryBullet = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).primaryColor =
                  this.primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor =
                  this.secondaryColor;
              Provider.of<_SlideshowModel>(context).primaryBullet =
                  this.primaryBullet;
              Provider.of<_SlideshowModel>(context).secondaryBullet =
                  this.secondaryBullet;
              return Column(
                children: <Widget>[
                  dotsUp ? _Dots(this.slides.length) : SizedBox.shrink(),
                  Expanded(child: _Slides(this.slides)),
                  !dotsUp ? _Dots(this.slides.length) : SizedBox.shrink()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget>
      slides; // Me equivoqué al principio, hay que ponerlo en final y verfiqué que el constructor estuviera bien para que todo funcionara
  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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
      child: PageView(
        controller: pageController,
        children: widget.slides.map((e) => _Slide(e)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: this.slide,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(30));
  }
}
//Tuve que hacerlo stateful para que fuera dinamico e inicializar la lista de dots me causó problemas porque la creé fixed y no aceptaba el .add()
// List <_Dot> dots;
//Mi solucion: Tiene que se Stateful
// @override
// void didChangeDependencies() {
//   super.didChangeDependencies();
//   dots=getDots();
// }

// List<_Dot> getDots(){
//   List<_Dot> res=List<_Dot>();
//   for (var i = 0; i < this.widget.numero; i++) {
//   res.add(_Dot(i));
// }
// return res;
// }
class _Dots extends StatelessWidget {
  final int numero;
  _Dots(this.numero);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.numero, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  int index;
  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    final pageViewProvider = Provider.of<_SlideshowModel>(context);
    final pageViewIndex = pageViewProvider.currentPage;
    double tamanio;
    Color color;
    if (pageViewIndex != null &&
        pageViewIndex >= index - 0.5 &&
        pageViewIndex < index + 0.5) {
      tamanio = pageViewProvider.primaryBullet;
      color = (themeChanger.darkTheme)
          ? themeChanger.currentTheme.accentColor
          : pageViewProvider.primaryColor;
    } else {
      tamanio = pageViewProvider.secondaryBullet;
      color = pageViewProvider.secondaryColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: tamanio,
      width: tamanio,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 15;
  double _secondaryBullet = 12;

  // _SlideshowModel(this._primaryColor, this._secondaryColor, this._primaryBullet,
  //     this._secondaryBullet);

  double get currentPage => _currentPage;
  set currentPage(double cp) {
    this._currentPage = cp;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color cp) {
    this._primaryColor = cp;
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor(Color cp) {
    this._secondaryColor = cp;
  }

  double get primaryBullet => this._primaryBullet;
  set primaryBullet(double cp) {
    this._primaryBullet = cp;
  }

  double get secondaryBullet => this._secondaryBullet;
  set secondaryBullet(double cp) {
    this._secondaryBullet = cp;
  }
}
