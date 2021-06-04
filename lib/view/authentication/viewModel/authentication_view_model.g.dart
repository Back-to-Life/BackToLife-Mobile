// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticationViewModel on _AuthenticationViewModelBase, Store {
  final _$randomCodeGetUserAtom =
      Atom(name: '_AuthenticationViewModelBase.randomCodeGetUser');

  @override
  TextEditingController get randomCodeGetUser {
    _$randomCodeGetUserAtom.reportRead();
    return super.randomCodeGetUser;
  }

  @override
  set randomCodeGetUser(TextEditingController value) {
    _$randomCodeGetUserAtom.reportWrite(value, super.randomCodeGetUser, () {
      super.randomCodeGetUser = value;
    });
  }

  final _$randomCodeInputAtom =
      Atom(name: '_AuthenticationViewModelBase.randomCodeInput');

  @override
  String get randomCodeInput {
    _$randomCodeInputAtom.reportRead();
    return super.randomCodeInput;
  }

  @override
  set randomCodeInput(String value) {
    _$randomCodeInputAtom.reportWrite(value, super.randomCodeInput, () {
      super.randomCodeInput = value;
    });
  }

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

  final _$mobilePermissionsAtom =
      Atom(name: '_AuthenticationViewModelBase.mobilePermissions');

  @override
  String get mobilePermissions {
    _$mobilePermissionsAtom.reportRead();
    return super.mobilePermissions;
  }

  @override
  set mobilePermissions(String value) {
    _$mobilePermissionsAtom.reportWrite(value, super.mobilePermissions, () {
      super.mobilePermissions = value;
    });
  }

  final _$isCheckedAtom = Atom(name: '_AuthenticationViewModelBase.isChecked');

  @override
  bool get isChecked {
    _$isCheckedAtom.reportRead();
    return super.isChecked;
  }

  @override
  set isChecked(bool value) {
    _$isCheckedAtom.reportWrite(value, super.isChecked, () {
      super.isChecked = value;
    });
  }

  final _$timerCountAtom =
      Atom(name: '_AuthenticationViewModelBase.timerCount');

  @override
  int get timerCount {
    _$timerCountAtom.reportRead();
    return super.timerCount;
  }

  @override
  set timerCount(int value) {
    _$timerCountAtom.reportWrite(value, super.timerCount, () {
      super.timerCount = value;
    });
  }

  final _$setUserPermissionsAsyncAction =
      AsyncAction('_AuthenticationViewModelBase.setUserPermissions');

  @override
  Future<void> setUserPermissions() {
    return _$setUserPermissionsAsyncAction
        .run(() => super.setUserPermissions());
  }

  final _$showPermissionsAsyncAction =
      AsyncAction('_AuthenticationViewModelBase.showPermissions');

  @override
  Future showPermissions(BuildContext context) {
    return _$showPermissionsAsyncAction
        .run(() => super.showPermissions(context));
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

  final _$codeWithSuccessAsyncAction =
      AsyncAction('_AuthenticationViewModelBase.codeWithSuccess');

  @override
  Future<void> codeWithSuccess() {
    return _$codeWithSuccessAsyncAction.run(() => super.codeWithSuccess());
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
  void changeCheckBox(bool? value) {
    final _$actionInfo = _$_AuthenticationViewModelBaseActionController
        .startAction(name: '_AuthenticationViewModelBase.changeCheckBox');
    try {
      return super.changeCheckBox(value);
    } finally {
      _$_AuthenticationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showLoginNumberCode(BuildContext context) {
    final _$actionInfo = _$_AuthenticationViewModelBaseActionController
        .startAction(name: '_AuthenticationViewModelBase.showLoginNumberCode');
    try {
      return super.showLoginNumberCode(context);
    } finally {
      _$_AuthenticationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextField(String value, FocusNode focusNode) {
    final _$actionInfo = _$_AuthenticationViewModelBaseActionController
        .startAction(name: '_AuthenticationViewModelBase.nextField');
    try {
      return super.nextField(value, focusNode);
    } finally {
      _$_AuthenticationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void timerFunction() {
    final _$actionInfo = _$_AuthenticationViewModelBaseActionController
        .startAction(name: '_AuthenticationViewModelBase.timerFunction');
    try {
      return super.timerFunction();
    } finally {
      _$_AuthenticationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
randomCodeGetUser: ${randomCodeGetUser},
randomCodeInput: ${randomCodeInput},
isEyeOpen: ${isEyeOpen},
isLoading: ${isLoading},
isLoginOrSignUp: ${isLoginOrSignUp},
isSuccess: ${isSuccess},
mobilePermissions: ${mobilePermissions},
isChecked: ${isChecked},
timerCount: ${timerCount}
    ''';
  }
}
