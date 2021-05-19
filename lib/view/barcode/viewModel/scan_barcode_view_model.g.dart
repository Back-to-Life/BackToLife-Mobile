// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_barcode_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScanBarcodeViewModel on _ScanBarcodeViewModelBase, Store {
  final _$barcodeScanResAtom =
      Atom(name: '_ScanBarcodeViewModelBase.barcodeScanRes');

  @override
  String? get barcodeScanRes {
    _$barcodeScanResAtom.reportRead();
    return super.barcodeScanRes;
  }

  @override
  set barcodeScanRes(String? value) {
    _$barcodeScanResAtom.reportWrite(value, super.barcodeScanRes, () {
      super.barcodeScanRes = value;
    });
  }

  final _$setBarcodeScanAsyncAction =
      AsyncAction('_ScanBarcodeViewModelBase.setBarcodeScan');

  @override
  Future<void> setBarcodeScan() {
    return _$setBarcodeScanAsyncAction.run(() => super.setBarcodeScan());
  }

  @override
  String toString() {
    return '''
barcodeScanRes: ${barcodeScanRes}
    ''';
  }
}
