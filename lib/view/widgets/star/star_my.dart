import 'dart:math';

import 'package:flutter/material.dart';

class StarMyBackground extends StatefulWidget {
  final Size screenSize;
  StarMyBackground({Key key, this.screenSize}) : super(key: key);

  @override
  _StarMyBackgroundState createState() => _StarMyBackgroundState();
}

class _StarMyBackgroundState extends State<StarMyBackground>
    with TickerProviderStateMixin {
  AnimationController animControlStar, animControlPlanet, animControlBg;
  Animation fadeAnimStar1,
      fadeAnimStar2,
      fadeAnimStar3,
      fadeAnimStar4,
      sizeAnimStar,
      rotateAnimStar;
  Animation fadeAnimPlanet1, fadeAnimPlanet2, fadeAnimPlanet3, fadeAnimPlanet4;
  Animation sizeAnimPlanet1, sizeAnimPlanet2, sizeAnimPlanet3, sizeAnimPlanet4;
  Animation colorAnimBgStart, colorAnimBgEnd;
  Size screenSize;
  List<Star> listStar;
  int numStars;
  @override
  void initState() {
    super.initState();

    screenSize = widget.screenSize;
    listStar = List();
    numStars = 30;

    // Star
    animControlStar = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    fadeAnimStar1 = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animControlStar, curve: Interval(0.0, 0.5)));
    fadeAnimStar1.addListener(() {
      setState(() {});
    });
    fadeAnimStar2 = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animControlStar, curve: Interval(0.5, 1.0)));
    fadeAnimStar2.addListener(() {
      setState(() {});
    });
    fadeAnimStar3 = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animControlStar, curve: Interval(0.0, 0.5)));
    fadeAnimStar3.addListener(() {
      setState(() {});
    });
    fadeAnimStar4 = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animControlStar, curve: Interval(0.5, 1.0)));
    fadeAnimStar4.addListener(() {
      setState(() {});
    });
    sizeAnimStar = Tween(begin: 0.0, end: 5.0).animate(
        CurvedAnimation(parent: animControlStar, curve: Interval(0.0, 0.5)));
    sizeAnimStar.addListener(() {
      setState(() {});
    });
    rotateAnimStar = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animControlStar, curve: Interval(0.0, 0.5)));
    rotateAnimStar.addListener(() {
      setState(() {});
    });

    animControlStar.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animControlStar.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animControlStar.forward();
      }
    });

    for (int i = 0; i < numStars; i++) {
      listStar.add(Star(
          left: Random().nextDouble() * screenSize.width,
          top: Random().nextDouble() * screenSize.height,
          extraSize: Random().nextDouble() * 2,
          angle: Random().nextDouble(),
          typeFade: Random().nextInt(4)));
    }
  }

  @override
  void dispose() {
    animControlStar.dispose();
    animControlPlanet.dispose();
    animControlBg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [buildGroupStar()],
    );
  }

  Widget buildGroupStar() {
    List<Widget> list = List();
    for (int i = 0; i < numStars; i++) {
      list.add(buildStar(listStar[i].left, listStar[i].top,
          listStar[i].extraSize, listStar[i].angle, listStar[i].typeFade));
    }
  }

  Widget buildStar(
      double left, double top, double extraSize, double angle, int typeFade) {
    return Positioned(
      child: Container(
        child: Transform.rotate(
          child: Opacity(
            child: Icon(
              Icons.star,
              color: Colors.white,
              size: sizeAnimStar.value + extraSize,
            ),
            opacity: (typeFade == 1)
                ? fadeAnimStar1.value
                : (typeFade == 2)
                    ? fadeAnimStar2.value
                    : (typeFade == 3)
                        ? fadeAnimStar3.value
                        : fadeAnimStar4.value,
          ),
          angle: angle,
        ),
        alignment: FractionalOffset.center,
        width: 10.0,
        height: 10.0,
      ),
      left: left,
      top: top,
    );
  }
}

class Star {
  // angle should be value 0.0 -> 1.0
  // left 0.0 -> 360.0
  // height 0.0 -> 640.0
  // typeFade 1 -> 4

  double left;
  double top;
  double extraSize;
  double angle;
  int typeFade;

  Star(
      {@required this.left,
      @required this.top,
      @required this.extraSize,
      @required this.angle,
      @required this.typeFade});
}
