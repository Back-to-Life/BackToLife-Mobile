import 'package:backtolife/core/base/view/base_view.dart';
import 'package:backtolife/core/extension/context_extension.dart';
import 'package:backtolife/core/init/svgPath/image_path_svg.dart';
import 'package:backtolife/view/splash/viewModel/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
        viewModel: SplashViewModel(),
        onModelReady: (SplashViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, value) => Scaffold(
                body: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    width: context.width * 1,
                    height: context.height * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          'asset/images/upperStack.png',
                        ),
                      ),
                    ),
                    // color: Colors.red,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: context.width * 1,
                    height: context.height * 0.47,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          'asset/images/bottomStack.png',
                        ),
                      ),
                    ),
                    // color: Colors.red,
                  ),
                ),
              ],
            )));
  }
}
