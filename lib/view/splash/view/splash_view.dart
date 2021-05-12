import 'package:backtolife/core/base/view/base_view.dart';
import 'package:backtolife/view/splash/viewModel/splash_view_model.dart';
import 'package:flutter/material.dart';

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
              body: Text('okey'),
            ));
  }
}
