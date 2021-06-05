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
  void firstEmailGetToken() {
    final _$actionInfo = _$_ForgotPasswordViewModelBaseActionController
        .startAction(name: '_ForgotPasswordViewModelBase.firstEmailGetToken');
    try {
      return super.firstEmailGetToken();
    } finally {
      _$_ForgotPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
opacityValue: ${opacityValue},
visible: ${visible}
    ''';
  }
}
