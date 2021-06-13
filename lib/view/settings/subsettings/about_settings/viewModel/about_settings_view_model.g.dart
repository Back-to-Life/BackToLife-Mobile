// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AboutUsViewModel on _AboutUsViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_AboutUsViewModelBase.isLoading');

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

  final _$aboutUsAtom = Atom(name: '_AboutUsViewModelBase.aboutUs');

  @override
  String? get aboutUs {
    _$aboutUsAtom.reportRead();
    return super.aboutUs;
  }

  @override
  set aboutUs(String? value) {
    _$aboutUsAtom.reportWrite(value, super.aboutUs, () {
      super.aboutUs = value;
    });
  }

  final _$setUserPermissionsAsyncAction =
      AsyncAction('_AboutUsViewModelBase.setUserPermissions');

  @override
  Future<void> setUserPermissions() {
    return _$setUserPermissionsAsyncAction
        .run(() => super.setUserPermissions());
  }

  final _$_AboutUsViewModelBaseActionController =
      ActionController(name: '_AboutUsViewModelBase');

  @override
  void loading() {
    final _$actionInfo = _$_AboutUsViewModelBaseActionController.startAction(
        name: '_AboutUsViewModelBase.loading');
    try {
      return super.loading();
    } finally {
      _$_AboutUsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
aboutUs: ${aboutUs}
    ''';
  }
}
