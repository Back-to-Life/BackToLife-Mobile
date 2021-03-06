import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import '../viewModel/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
      lowerBound: 0.5,
      upperBound: 1.5,
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
        viewModel: SplashViewModel(),
        onModelReady: (SplashViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, value) => Scaffold(
                body: Stack(children: [
              _bottomUpper(context),
              Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Spacer(),
                    Expanded(child: _centerText(context)),
                    Expanded(child: _centerIcon()),
                    Spacer(flex: 2),
                  ])),
              _bottomStack(context)
            ])));
  }

  Center _centerText(BuildContext context) {
    return Center(
        child: Text('BACK TO LIFE',
            style: context.textTheme.headline4!.copyWith(
                fontWeight: FontWeight.bold, color: Color(0xFF72A863))));
  }

  Widget _centerIcon() {
    return ScaleTransition(
        scale: animationController,
        child:
            Center(child: SvgPicture.asset(SVGImagePaths.instance.splashIcon)));
  }

  Positioned _bottomUpper(BuildContext context) {
    return Positioned(
        top: 0,
        child: Container(
            width: context.width * 1,
            height: context.height * 0.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      'asset/images/upperStack.png',
                    )))));
  }

  Positioned _bottomStack(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
            width: context.width * 1,
            height: context.height * 0.47,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      'asset/images/bottomStack.png',
                    )))));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
