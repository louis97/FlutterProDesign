import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/printerest_menu.dart';
import 'package:provider/provider.dart';

class PrinterestScreen extends StatelessWidget {
  const PrinterestScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: PrinterestMenu(),
      // body: PrinterestGrid(),
      body: ChangeNotifierProvider(
        create: (context) => _MenuModel(),
        child: Stack(
          children: [PrinterestGrid(), _PrinterestMenuPositioned()],
        ),
      ),
    );
  }
}

class _PrinterestMenuPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
        bottom: 30,
        child: Container(
            alignment: Alignment.center,
            height: 60,
            width: screenWidth,
            child: PrinterestMenu(
              mostrar: Provider.of<_MenuModel>(context).mostrar,
              // activeColor: Colors.pink,
              // inactiveColor: Colors.black38,
              // backgroundColor: Colors.green,
              items: [
                PrinterestButton(
                    icon: Icons.pie_chart,
                    callback: () {
                      print('pie_chart has been pressed');
                    }),
                PrinterestButton(
                    icon: Icons.search,
                    callback: () {
                      print('search has been pressed');
                    }),
                PrinterestButton(
                    icon: Icons.notifications,
                    callback: () {
                      print('notifications has been pressed');
                    }),
                PrinterestButton(
                    icon: Icons.supervised_user_circle,
                    callback: () {
                      print('supervised_user_circle has been pressed');
                    }),
              ],
            )));
  }
}

class PrinterestGrid extends StatefulWidget {
  @override
  _PrinterestGridState createState() => _PrinterestGridState();
}

class _PrinterestGridState extends State<PrinterestGrid> {
  List<int> items = List.generate(200, (index) => index);
  ScrollController scrollController;
  double scrollAnterior = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset > scrollAnterior &&
          scrollController.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = scrollController.offset;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => PrinterestItem(index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class PrinterestItem extends StatelessWidget {
  final int index;
  PrinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;
  get mostrar => _mostrar;
  set mostrar(bool newMostrar) {
    this._mostrar = newMostrar;
    notifyListeners();
  }
}
