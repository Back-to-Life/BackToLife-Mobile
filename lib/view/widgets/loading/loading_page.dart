import 'package:backtolife/core/extension/context_extension.dart';
import 'package:backtolife/core/init/image/lottie_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
                color: context.colors.secondaryVariant,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: context.lowValue,
                      blurRadius: context.lowValue,
                      offset: Offset(0, context.lowValue))
                ],
                borderRadius: BorderRadius.circular(context.highValue)),
            height: context.height * 0.1,
            width: context.width * 0.2,
            child: Lottie.asset(LottiePaths.instance.loadingPageContainer)));
  }
}
