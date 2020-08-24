import 'dart:math';

import 'package:flutter/material.dart';

class SliverListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _Header(),
      // body: _ListaTareas(),
      body: Stack(
        children: [
          _MainScroller(),
          Positioned(right: 0, bottom: 0, child: _NewListButton())
        ],
      ),
    );
  }
}

class _NewListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ButtonTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
      height: 100,
      minWidth: size.width * 0.9,
      child: RaisedButton(
        color: Color(0xffed6762),
        onPressed: () {},
        child: Text(
          ' CREATE NEW LIST ',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 3),
        ),
      ),
    );
  }
}

class _MainScroller extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red, title: Text('hila'),),
        SliverPersistentHeader(
          delegate: _SliverCustomHeaderDelegate(
              minHeight: 170,
              maxHeight: 200,
              child: Container(
                alignment: Alignment.centerLeft,
                child: _Header(),
                color: Colors.white,
              )),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(
              height: 100,
            )
          ]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {@required this.maxHeight,
      @required this.minHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      child: this.child,
    );
  }

  @override
  double get maxExtent => max(minHeight, maxHeight);

  @override
  double get minExtent => min(minHeight, maxHeight);

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(fontSize: 50, color: Color(0xff532128)),
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: 100,
            ),
            Text(
              'List',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffd93a30)),
            ),
            Positioned(
              bottom: 8,
              child: Container(
                height: 3,
                width: 80,
                decoration: BoxDecoration(
                    color: Color(0xffd93a30),
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final Color color;
  final String title;

  const _ListItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      child: Text(
        this.title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: this.color),
    );
  }
}
