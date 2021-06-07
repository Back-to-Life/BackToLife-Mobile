// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordViewModel on _ForgotPasswordViewModelBase, Store {
  final _$opacityValueAtom =
      Atom(name: '_ForgotPasswordViewModelBase.opacityValue');

  @override
  double get opacityValue {
    _$opacityValueAtom.reportRead();
    return super.opacityValue;
  }

  @override
  set opacityValue(double value) {
    _$opacityValueAtom.reportWrite(value, super.opacityValue, () {
      super.opacityValue = value;
    });
  }

  final _$visibleAtom = Atom(name: '_ForgotPasswordViewModelBase.visible');

  @override
  bool get visible {
    _$visibleAtom.reportRead();
    return super.visible;
  }

  @override
  set visible(bool value) {
    _$visibleAtom.reportWrite(value, super.visible, () {
      super.visible = value;
    });
  }

  final _$emailStringAtom =
      Atom(name: '_ForgotPasswordViewModelBase.emailString');

  @override
  String? get emailString {
    _$emailStringAtom.reportRead();
    return super.emailString;
  }

  @override
  set emailString(String? value) {
    _$emailStringAtom.reportWrite(value, super.emailString, () {
      super.emailString = value;
    });
  }

  final _$passwordStringAtom =
      Atom(name: '_ForgotPasswordViewModelBase.passwordString');

  @override
  String? get passwordString {
    _$passwordStringAtom.reportRead();
    return super.passwordString;
  }

  @override
  set passwordString(String? value) {
    _$passwordStringAtom.reportWrite(value, super.passwordString, () {
      super.passwordString = value;
    });
  }

  final _$tokenIntAtom = Atom(name: '_ForgotPasswordViewModelBase.tokenInt');

  @override
  int? get tokenInt {
    _$tokenIntAtom.reportRead();
    return super.tokenInt;
  }

  @override
  set tokenInt(int? value) {
    _$tokenIntAtom.reportWrite(value, super.tokenInt, () {
      super.tokenInt = value;
    });
  }

  final _$tokenSendServiceAtom =
      Atom(name: '_ForgotPasswordViewModelBase.tokenSendService');

  @override
  bool get tokenSendService {
    _$tokenSendServiceAtom.reportRead();
    return super.tokenSendService;
  }

  @override
  set tokenSendService(bool value) {
    _$tokenSendServiceAtom.reportWrite(value, super.tokenSendService, () {
      super.tokenSendService = value;
    });
  }

  final _$firstEmailGetTokenAsyncAction =
      AsyncAction('_ForgotPasswordViewModelBase.firstEmailGetToken');

  @override
  Future<void> firstEmailGetToken() {
    return _$firstEmailGetTokenAsyncAction
        .run(() => super.firstEmailGetToken());
  }

  final _$sendPasswordAndTokenAsyncAction =
      AsyncAction('_ForgotPasswordViewModelBase.sendPasswordAndToken');

  @override
  Future<void> sendPasswordAndToken() {
    return _$sendPasswordAndTokenAsyncAction
        .run(() => super.sendPasswordAndToken());
  }

  final _$_ForgotPasswordViewModelBaseActionController =
      ActionController(name: '_ForgotPasswordViewModelBase');

  @override
  void changedOpacity() {
    final _$actionInfo = _$_ForgotPasswordViewModelBaseActionController
        .startAction(name: '_ForgotPasswordViewModelBase.changedOpacity');
    try {
      return super.changedOpacity();
    } finally {
      _$_ForgotPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePage() {
    final _$actionInfo = _$_ForgotPasswordViewModelBaseActionController
        .startAction(name: '_ForgotPasswordViewModelBase.changePage');
    try {
      return super.changePage();
    } finally {
      _$_ForgotPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigate() {
    final _$actionInfo = _$_ForgotPasswordViewModelBaseActionController
        .startAction(name: '_ForgotPasswordViewModelBase.navigate');
    try {
      return super.navigate();
    } finally {
      _$_ForgotPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showSuccess() {
    final _$actionInfo = _$_ForgotPasswordViewModelBaseActionController
        .startAction(name: '_ForgotPasswordViewModelBase.showSuccess');
    try {
      return super.showSuccess();
    } finally {
      _$_ForgotPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
opacityValue: ${opacityValue},
visible: ${visible},
emailString: ${emailString},
passwordString: ${passwordString},
tokenInt: ${tokenInt},
tokenSendService: ${tokenSendService}
    ''';
  }
}
