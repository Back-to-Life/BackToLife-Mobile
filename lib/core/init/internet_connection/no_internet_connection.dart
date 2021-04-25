import '../../../view/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoConnected extends StatelessWidget {
  const NoConnected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: LottieBuilder.asset(
                    'asset/lottie/nointernetconnection.json')),
          ],
        ),
      ),
    );
  }
}
