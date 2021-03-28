// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;



// class HeroAnimationScreen extends StatefulWidget {
//   final Size screenSize;

//   HeroAnimationScreen({Key key, @required this.screenSize}) : super(key: key);

//   @override
//   State createState() => HeroAnimationScreenState();
// }

// class HeroAnimationScreenState extends State<HeroAnimationScreen> with TickerProviderStateMixin {


//   AnimationController animControlStar, animControlPlanet, animControlBg;
//   Animation fadeAnimStar1, fadeAnimStar2, fadeAnimStar3, fadeAnimStar4, sizeAnimStar, rotateAnimStar;
//   Animation fadeAnimPlanet1, fadeAnimPlanet2, fadeAnimPlanet3, fadeAnimPlanet4;
//   Animation sizeAnimPlanet1, sizeAnimPlanet2, sizeAnimPlanet3, sizeAnimPlanet4;
//   Animation colorAnimBgStart, colorAnimBgEnd;
//   Size screenSize;
//   List<Star> listStar;
//   int numStars;

 



 

//     return new Stack(
//       children: <Widget>[
//         list[0],
//         list[1],
//         list[2],
//         list[3],
//         list[4],
//         list[5],
//         list[6],
//         list[7],
//         list[8],
//         list[9],
//         list[10],
//         list[11],
//         list[12],
//         list[13],
//         list[14],
//         list[15],
//         list[16],
//         list[17],
//         list[18],
//         list[19],
//         list[20],
//         list[21],
//         list[22],
//         list[23],
//         list[24],
//         list[25],
//         list[26],
//         list[27],
//         list[28],
//         list[29],
//       ],
//     );
//   }

//   @override
//   void initState() {
//     super.initState();

//     screenSize = widget.screenSize;
//     listStar = new List();
//     numStars = 30;

//     // Star
//     animControlStar = new AnimationController(vsync: this, duration: new Duration(milliseconds: 2000));
//     fadeAnimStar1 = new Tween(begin: 0.0, end: 1.0)
//         .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.0, 0.5)));
//     fadeAnimStar1.addListener(() {
//       setState(() {});
//     });
//     fadeAnimStar2 = new Tween(begin: 0.0, end: 1.0)
//         .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.5, 1.0)));
//     fadeAnimStar2.addListener(() {
//       setState(() {});
//     });
//     fadeAnimStar3 = new Tween(begin: 1.0, end: 0.0)
//         .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.0, 0.5)));
//     fadeAnimStar3.addListener(() {
//       setState(() {});
//     });
//     fadeAnimStar4 = new Tween(begin: 1.0, end: 0.0)
//         .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.5, 1.0)));
//     fadeAnimStar4.addListener(() {
//       setState(() {});
//     });
//     sizeAnimStar = new Tween(begin: 0.0, end: 5.0)
//         .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.0, 0.5)));
//     sizeAnimStar.addListener(() {
//       setState(() {});
//     });
//     rotateAnimStar = new Tween(begin: 0.0, end: 1.0)
//         .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.0, 0.5)));
//     rotateAnimStar.addListener(() {
//       setState(() {});
//     });

//     animControlStar.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         animControlStar.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         animControlStar.forward();
//       }
//     });

//     for (int i = 0; i < numStars; i++) {
//       listStar.add(new Star(
//           left: new Random().nextDouble() * screenSize.width,
//           top: Random().nextDouble() * screenSize.height,
//           extraSize: Random().nextDouble() * 2,
//           angle: Random().nextDouble(),
//           typeFade: Random().nextInt(4)));
//     }

//     // Planet
  

//     // Background
//     animControlBg = new AnimationController(vsync: this, duration: new Duration(milliseconds: 5000));
//     animControlBg.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         animControlBg.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         animControlBg.forward();
//       }
//     });
//     colorAnimBgStart = new ColorTween(begin: gradientStartFrom, end: gradientStartTo).animate(animControlBg);
//     colorAnimBgEnd = new ColorTween(begin: gradientEndFrom, end: gradientEndTo).animate(animControlBg);

//     // Let's go
//     animControlStar.forward();
//     animControlPlanet.forward();
//     animControlBg.forward();
//   }

//   @override
//   void dispose() {
//     animControlStar.dispose();
//     animControlPlanet.dispose();
//     animControlBg.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     timeDilation = durationSlowMode;

//     return new Stack(
//       children: <Widget>[
//         new Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: new BoxDecoration(
//                 gradient: new LinearGradient(
//                     colors: [colorAnimBgStart.value, colorAnimBgEnd.value],
//                     begin: new FractionalOffset(0.0, 0.5),
//                     end: new FractionalOffset(0.5, 1.0),
//                     tileMode: TileMode.mirror)),
//             child: buildGroupStar()),
//         new SingleChildScrollView(
//           child: new Container(
//             child: new Column(
//               children: <Widget>[
//                 buildHeroIcon(context, listPlanet.planets[0], 1),
//                 buildHeroIcon(context, listPlanet.planets[1], 2),
//                 buildHeroIcon(context, listPlanet.planets[2], 3),
//                 buildHeroIcon(context, listPlanet.planets[3], 4),
//                 buildHeroIcon(context, listPlanet.planets[4], 4),
//                 buildHeroIcon(context, listPlanet.planets[5], 4),
//                 buildHeroIcon(context, listPlanet.planets[6], 4),
//                 buildHeroIcon(context, listPlanet.planets[7], 4),
//               ],
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             ),
//             padding: new EdgeInsets.all(20.0),
//             alignment: FractionalOffset.center,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class RadialExpansion extends StatelessWidget {
//   RadialExpansion({
//     Key key,
//     this.maxRadius,
//     this.child,
//   })  : clipRectSize = 2.0 * (maxRadius / sqrt2),
//         super(key: key);

//   final double maxRadius;
//   final clipRectSize;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return new Center(
//       child: new SizedBox(
//         width: clipRectSize,
//         height: clipRectSize,
//         child: child,
//       ),
//     );
//   }
// }

// class Photo extends StatelessWidget {
//   Photo({Key key, this.photo, this.color, this.onTap}) : super(key: key);

//   final String photo;
//   final Color color;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return new Material(
//       color: Colors.transparent,
//       child: new InkWell(
//         onTap: onTap,
//         child: new Image.asset(
//           photo,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }

