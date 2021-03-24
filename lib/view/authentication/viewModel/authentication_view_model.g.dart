// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticationViewModel on _AuthenticationViewModelBase, Store {
  final _$isEyeOpenAtom = Atom(name: '_AuthenticationViewModelBase.isEyeOpen');

  @override
  bool get isEyeOpen {
    _$isEyeOpenAtom.reportRead();
    return super.isEyeOpen;
  }

  @override
  set isEyeOpen(bool value) {
    _$isEyeOpenAtom.reportWrite(value, super.isEyeOpen, () {
      super.isEyeOpen = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AuthenticationViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoginOrSignUpAtom =
      Atom(name: '_AuthenticationViewModelBase.isLoginOrSignUp');

  @override
  bool get isLoginOrSignUp {
    _$isLoginOrSignUpAtom.reportRead();
    return super.isLoginOrSignUp;
  }

  @override
  set isLoginOrSignUp(bool value) {
    _$isLoginOrSignUpAtom.reportWrite(value, super.isLoginOrSignUp, () {
      super.isLoginOrSignUp = value;
    });
  }

  final _$isSuccessAtom = Atom(name: '_AuthenticationViewModelBase.isSuccess');

  @override
  bool get isSuccess {
    _$isSuccessAtom.reportRead();
    return super.isSuccess;
  }

  @override
  set isSuccess(bool value) {
    _$isSuccessAtom.reportWrite(value, super.isSuccess, () {
      super.isSuccess = value;
    });
  }

  final _$fetchLoginServiceAsyncAction =
      AsyncAction('_AuthenticationViewModelBase.fetchLoginService');

  @override
  Future<void> fetchLoginService() {
    return _$fetchLoginServiceAsyncAction.run(() => super.fetchLoginService());
  }

  final _$fetchSignUpServiceAsyncAction =
      AsyncAction('_AuthenticationViewModelBase.fetchSignUpService');

  @override
  Future<void> fetchSignUpService() {
    return _$fetchSignUpServiceAsyncAction
        .run(() => super.fetchSignUpService());
  }

  final _$_AuthenticationViewModelBaseActionController =
      ActionController(name: '_AuthenticationViewModelBase');

  @override
  void changedLoading() {
    final _$actionInfo = _$_AuthenticationViewModelBaseActionController
        .startAction(name: '_AuthenticationViewModelBase.changedLoading');
    try {
      return super.changedLoading();
    } finally {
      _$_AuthenticationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void successChanged() {
    final _$actionInfo = _$_AuthenticationViewModelBaseActionController
        .startAction(name: '_AuthenticationViewModelBase.successChanged');
    try {
      return super.successChanged();
    } finally {
      _$_AuthenticationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changedTabBar() {
    final _$actionInfo = _$_AuthenticationViewModelBaseActionController
        .startAction(name: '_AuthenticationViewModelBase.changedTabBar');
    try {
      return super.changedTabBar();
    } finally {
      _$_AuthenticationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isEyeOpenFun() {
    final _$actionInfo = _$_AuthenticationViewModelBaseActionController
        .startAction(name: '_AuthenticationViewModelBase.isEyeOpenFun');
    try {
      return super.isEyeOpenFun();
    } finally {
      _$_AuthenticationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEyeOpen: ${isEyeOpen},
isLoading: ${isLoading},
isLoginOrSignUp: ${isLoginOrSignUp},
isSuccess: ${isSuccess}
    ''';
  }
}
