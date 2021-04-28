import '../../../core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:mobx/mobx.dart';
part 'scan_barcode_view_model.g.dart';

class ScanBarcodeViewModel = _ScanBarcodeViewModelBase
    with _$ScanBarcodeViewModel;

abstract class _ScanBarcodeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}
