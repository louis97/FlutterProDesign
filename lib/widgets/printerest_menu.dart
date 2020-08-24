import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrinterestButton {
  final IconData icon;
  final Function callback;

  PrinterestButton({@required this.icon, @required this.callback});
}

class PrinterestMenu extends StatelessWidget {
  final List<PrinterestButton> items;
  final bool mostrar;
  final Color activeColor; //black
  final Color inactiveColor; //gray
  final Color backgroundColor; //gray

  PrinterestMenu(
      {this.mostrar = true,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.grey,
      this.backgroundColor = Colors.white,
      @required this.items
      });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: mostrar ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context, listen: false).activeColor=this.activeColor;
            Provider.of<_MenuModel>(context, listen: false).inactiveColor=this.inactiveColor;
            Provider.of<_MenuModel>(context, listen: false).backgroundColor=this.backgroundColor;

            return _PrinteresMenuBackground(
              _MenuItems(this.items),
            );
          },
        ),
      ),
    );
  }
}

class _PrinteresMenuBackground extends StatelessWidget {
  final Widget child;
  _PrinteresMenuBackground(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: 60,
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Provider.of<_MenuModel>(context).backgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  List<PrinterestButton> items;
  _MenuItems(this.items);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(this.items.length,
          (index) => _PrinterestMenuButton(index, this.items[index])),
    );
  }
}

class _PrinterestMenuButton extends StatelessWidget {
  int index;
  PrinterestButton item;
  _PrinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final selectedItem = Provider.of<_MenuModel>(context).selectedItem;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        color: (selectedItem == index)
            ? Provider.of<_MenuModel>(context)._activeColor
            : Provider.of<_MenuModel>(context)._inactiveColor,
        size: (selectedItem == index) ? 35 : 25,
      ),
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedItem = index;
        item.callback();
      },
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.grey;
  Color _backgroundColor = Colors.white;

  get selectedItem => this._selectedItem;
  set selectedItem(int newItem) {
    this._selectedItem = newItem;
    notifyListeners();
  }

  get activeColor => _activeColor;
  set activeColor(Color newColor) {
    this._activeColor = newColor;
  }

  get inactiveColor => _activeColor;
  set inactiveColor(Color newColor) {
    this._inactiveColor = newColor;
  }
  
  get backgroundColor => _backgroundColor;
  set backgroundColor(Color newColor) {
    this._backgroundColor = newColor;
  }
}
