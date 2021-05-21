// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  final _$pickedFileAtom = Atom(name: '_ProfileViewModelBase.pickedFile');

  @override
  PickedFile get pickedFile {
    _$pickedFileAtom.reportRead();
    return super.pickedFile;
  }

  @override
  set pickedFile(PickedFile value) {
    _$pickedFileAtom.reportWrite(value, super.pickedFile, () {
      super.pickedFile = value;
    });
  }

  final _$downloadUrlAtom = Atom(name: '_ProfileViewModelBase.downloadUrl');

  @override
  String? get downloadUrl {
    _$downloadUrlAtom.reportRead();
    return super.downloadUrl;
  }

  @override
  set downloadUrl(String? value) {
    _$downloadUrlAtom.reportWrite(value, super.downloadUrl, () {
      super.downloadUrl = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProfileViewModelBase.isLoading');

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

  final _$isLoadingPageDataAtom =
      Atom(name: '_ProfileViewModelBase.isLoadingPageData');

  @override
  bool get isLoadingPageData {
    _$isLoadingPageDataAtom.reportRead();
    return super.isLoadingPageData;
  }

  @override
  set isLoadingPageData(bool value) {
    _$isLoadingPageDataAtom.reportWrite(value, super.isLoadingPageData, () {
      super.isLoadingPageData = value;
    });
  }

  final _$uploadImageFirebaseAsyncAction =
      AsyncAction('_ProfileViewModelBase.uploadImageFirebase');

  @override
  Future<void> uploadImageFirebase() {
    return _$uploadImageFirebaseAsyncAction
        .run(() => super.uploadImageFirebase());
  }

  final _$_changeDatabaseUrlAsyncAction =
      AsyncAction('_ProfileViewModelBase._changeDatabaseUrl');

  @override
  Future<void> _changeDatabaseUrl(String downloadUrl) {
    return _$_changeDatabaseUrlAsyncAction
        .run(() => super._changeDatabaseUrl(downloadUrl));
  }

  final _$_getProfileDataAsyncAction =
      AsyncAction('_ProfileViewModelBase._getProfileData');

  @override
  Future<void> _getProfileData() {
    return _$_getProfileDataAsyncAction.run(() => super._getProfileData());
  }

  final _$_ProfileViewModelBaseActionController =
      ActionController(name: '_ProfileViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoadingData() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase._changeLoadingData');
    try {
      return super._changeLoadingData();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pickedFile: ${pickedFile},
downloadUrl: ${downloadUrl},
isLoading: ${isLoading},
isLoadingPageData: ${isLoadingPageData}
    ''';
  }
}
