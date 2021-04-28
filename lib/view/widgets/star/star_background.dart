import 'dart:math';

import 'package:flutter/material.dart';

class StarBackGround extends StatefulWidget {
  StarBackGround({Key? key}) : super(key: key);

  @override
  _StarBackGroundState createState() => _StarBackGroundState();
}

class _StarBackGroundState extends State<StarBackGround>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late Animation fadeAnimStar1, fadeAnimStar2, fadeAnimStar3, fadeAnimStar4;
  late AnimationController _animationController;
  List<WhereStar> listStar = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    final animationCurve = CurvedAnimation(
        curve: Curves.easeInExpo,
        reverseCurve: Curves.easeIn,
        parent: _animationController);
    _animation = Tween<double>(begin: 5, end: 6).animate(animationCurve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });

    fadeAnimStar1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.0, 0.5)));
    fadeAnimStar1.addListener(() {
      setState(() {});
    });
    fadeAnimStar2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.5, 1.0)));
    fadeAnimStar2.addListener(() {
      setState(() {});
    });
    fadeAnimStar3 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.0, 0.5)));
    fadeAnimStar3.addListener(() {
      setState(() {});
    });
    fadeAnimStar4 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.5, 1.0)));
    fadeAnimStar4.addListener(() {
      setState(() {});
    });

    for (int i = 0; i < 200; i++) {
      listStar.add(WhereStar(
          left: Random().nextDouble() * 500,
          bottom: Random().nextDouble() * 200,
          top: Random().nextDouble() * 500,
          extraSize: Random().nextDouble() * 4,
          angle: Random().nextDouble(),
          typeFade: Random().nextInt(4)));
    }
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: buildGroupStar(),
            )
          ],
        ));
  }

  Widget buildStar(double left, double top, double extraSize, double angle,
      double bottom, int typeFade) {
    return Positioned(
      child: Container(
        child: Transform.rotate(
          child: Transform.translate(
            offset: Offset(_animation.value, 10.0),
            child: Opacity(
              child: Icon(
                Icons.star,
                color: Colors.white,
                size: _animation.value * 1.5 + extraSize,
              ),
              opacity: (typeFade == 1)
                  ? fadeAnimStar1.value
                  : (typeFade == 2)
                      ? fadeAnimStar2.value
                      : (typeFade == 3)
                          ? fadeAnimStar3.value
                          : fadeAnimStar4.value,
            ),
          ),
          angle: angle,
        ),
        alignment: FractionalOffset.center,
      ),
      bottom: bottom,
      left: left,
      top: top,
    );
  }

  Widget buildGroupStar() {
    List<Widget> list = [];
    for (int i = 0; i < 200; i++) {
      list.add(buildStar(
        listStar[i].left,
        listStar[i].top,
        listStar[i].extraSize,
        listStar[i].angle,
        listStar[i].bottom,
        listStar[i].typeFade,
      ));
    }
    return Stack(children: list);
  }
}

class WhereStar {
  double left;
  double top;
  double extraSize;
  double angle;
  double bottom;
  int typeFade;

  WhereStar({
    required this.left,
    required this.top,
    required this.extraSize,
    required this.angle,
    required this.bottom,
    required this.typeFade,
  });
}
