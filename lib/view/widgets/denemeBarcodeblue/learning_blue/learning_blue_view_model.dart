import 'package:backtolife/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:mobx/mobx.dart';

part 'learning_blue_view_model.g.dart';

class LearningBlueViewModel = _LearningBlueViewModelBase
    with _$LearningBlueViewModel;

abstract class _LearningBlueViewModelBase with Store, BaseViewModel {
  late final FlutterBlue flutterBlue;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    flutterBlue = FlutterBlue.instance;
  }

  // flutterBlue.

/*   // Start scanning
  flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
var subscription = flutterBlue.scanResults.listen((results) {
    // do something with scan results
    for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
    }
});

// Stop scanning
flutterBlue.stopScan(); */
}
