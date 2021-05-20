// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_barcode_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScanBarcodeViewModel on _ScanBarcodeViewModelBase, Store {
  final _$barcodeScanAtom = Atom(name: '_ScanBarcodeViewModelBase.barcodeScan');

  @override
  String? get barcodeScan {
    _$barcodeScanAtom.reportRead();
    return super.barcodeScan;
  }

  @override
  set barcodeScan(String? value) {
    _$barcodeScanAtom.reportWrite(value, super.barcodeScan, () {
      super.barcodeScan = value;
    });
  }

  final _$containerQrAtom = Atom(name: '_ScanBarcodeViewModelBase.containerQr');

  @override
  String? get containerQr {
    _$containerQrAtom.reportRead();
    return super.containerQr;
  }

  @override
  set containerQr(String? value) {
    _$containerQrAtom.reportWrite(value, super.containerQr, () {
      super.containerQr = value;
    });
  }

  final _$goToContainerSuccessAtom =
      Atom(name: '_ScanBarcodeViewModelBase.goToContainerSuccess');

  @override
  bool get goToContainerSuccess {
    _$goToContainerSuccessAtom.reportRead();
    return super.goToContainerSuccess;
  }

  @override
  set goToContainerSuccess(bool value) {
    _$goToContainerSuccessAtom.reportWrite(value, super.goToContainerSuccess,
        () {
      super.goToContainerSuccess = value;
    });
  }

  final _$stepNumberAtom = Atom(name: '_ScanBarcodeViewModelBase.stepNumber');

  @override
  int get stepNumber {
    _$stepNumberAtom.reportRead();
    return super.stepNumber;
  }

  @override
  set stepNumber(int value) {
    _$stepNumberAtom.reportWrite(value, super.stepNumber, () {
      super.stepNumber = value;
    });
  }

  final _$setBarcodeScanAsyncAction =
      AsyncAction('_ScanBarcodeViewModelBase.setBarcodeScan');

  @override
  Future<void> setBarcodeScan() {
    return _$setBarcodeScanAsyncAction.run(() => super.setBarcodeScan());
  }

  final _$setContainerBarcodeScanAsyncAction =
      AsyncAction('_ScanBarcodeViewModelBase.setContainerBarcodeScan');

  @override
  Future<void> setContainerBarcodeScan() {
    return _$setContainerBarcodeScanAsyncAction
        .run(() => super.setContainerBarcodeScan());
  }

  final _$completePointServiceCallAsyncAction =
      AsyncAction('_ScanBarcodeViewModelBase.completePointServiceCall');

  @override
  Future<void> completePointServiceCall() {
    return _$completePointServiceCallAsyncAction
        .run(() => super.completePointServiceCall());
  }

  final _$scanBarcodeDialogAsyncAction =
      AsyncAction('_ScanBarcodeViewModelBase.scanBarcodeDialog');

  @override
  Future<void> scanBarcodeDialog() {
    return _$scanBarcodeDialogAsyncAction.run(() => super.scanBarcodeDialog());
  }

  final _$isNotSameNameAsyncAction =
      AsyncAction('_ScanBarcodeViewModelBase.isNotSameName');

  @override
  Future<void> isNotSameName() {
    return _$isNotSameNameAsyncAction.run(() => super.isNotSameName());
  }

  final _$isSuccessServiceAsyncAction =
      AsyncAction('_ScanBarcodeViewModelBase.isSuccessService');

  @override
  Future<void> isSuccessService() {
    return _$isSuccessServiceAsyncAction.run(() => super.isSuccessService());
  }

  @override
  String toString() {
    return '''
barcodeScan: ${barcodeScan},
containerQr: ${containerQr},
goToContainerSuccess: ${goToContainerSuccess},
stepNumber: ${stepNumber}
    ''';
  }
}
