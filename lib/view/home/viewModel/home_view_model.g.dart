// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$targetsAtom = Atom(name: '_HomeViewModelBase.targets');

  @override
  List<TargetFocus> get targets {
    _$targetsAtom.reportRead();
    return super.targets;
  }

  @override
  set targets(List<TargetFocus> value) {
    _$targetsAtom.reportWrite(value, super.targets, () {
      super.targets = value;
    });
  }

  final _$_localeValueAtom = Atom(name: '_HomeViewModelBase._localeValue');

  @override
  bool? get _localeValue {
    _$_localeValueAtom.reportRead();
    return super._localeValue;
  }

  @override
  set _localeValue(bool? value) {
    _$_localeValueAtom.reportWrite(value, super._localeValue, () {
      super._localeValue = value;
    });
  }

  final _$isSelectedToggleAtom =
      Atom(name: '_HomeViewModelBase.isSelectedToggle');

  @override
  bool get isSelectedToggle {
    _$isSelectedToggleAtom.reportRead();
    return super.isSelectedToggle;
  }

  @override
  set isSelectedToggle(bool value) {
    _$isSelectedToggleAtom.reportWrite(value, super.isSelectedToggle, () {
      super.isSelectedToggle = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeViewModelBase.isLoading');

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

  final _$numberAtom = Atom(name: '_HomeViewModelBase.number');

  @override
  int get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(int value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  final _$getTutorialSuccessAsyncAction =
      AsyncAction('_HomeViewModelBase.getTutorialSuccess');

  @override
  Future<void> getTutorialSuccess() {
    return _$getTutorialSuccessAsyncAction
        .run(() => super.getTutorialSuccess());
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void changedToggle() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changedToggle');
    try {
      return super.changedToggle();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.increment');
    try {
      return super.increment();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeToggleButtonInit() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeToggleButtonInit');
    try {
      return super.changeToggleButtonInit();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initTargets() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.initTargets');
    try {
      return super.initTargets();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _layout(dynamic _) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase._layout');
    try {
      return super._layout(_);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showTutorial() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.showTutorial');
    try {
      return super.showTutorial();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
targets: ${targets},
isSelectedToggle: ${isSelectedToggle},
isLoading: ${isLoading},
number: ${number}
    ''';
  }
}
