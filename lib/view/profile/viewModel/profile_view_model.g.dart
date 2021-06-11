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

  final _$imageProfileUrlAtom =
      Atom(name: '_ProfileViewModelBase.imageProfileUrl');

  @override
  String? get imageProfileUrl {
    _$imageProfileUrlAtom.reportRead();
    return super.imageProfileUrl;
  }

  @override
  set imageProfileUrl(String? value) {
    _$imageProfileUrlAtom.reportWrite(value, super.imageProfileUrl, () {
      super.imageProfileUrl = value;
    });
  }

  final _$starValueAtom = Atom(name: '_ProfileViewModelBase.starValue');

  @override
  int? get starValue {
    _$starValueAtom.reportRead();
    return super.starValue;
  }

  @override
  set starValue(int? value) {
    _$starValueAtom.reportWrite(value, super.starValue, () {
      super.starValue = value;
    });
  }

  final _$percentValueAtom = Atom(name: '_ProfileViewModelBase.percentValue');

  @override
  double? get percentValue {
    _$percentValueAtom.reportRead();
    return super.percentValue;
  }

  @override
  set percentValue(double? value) {
    _$percentValueAtom.reportWrite(value, super.percentValue, () {
      super.percentValue = value;
    });
  }

  final _$isLoadingStarAtom = Atom(name: '_ProfileViewModelBase.isLoadingStar');

  @override
  bool get isLoadingStar {
    _$isLoadingStarAtom.reportRead();
    return super.isLoadingStar;
  }

  @override
  set isLoadingStar(bool value) {
    _$isLoadingStarAtom.reportWrite(value, super.isLoadingStar, () {
      super.isLoadingStar = value;
    });
  }

  final _$isChangingProfilePictureAtom =
      Atom(name: '_ProfileViewModelBase.isChangingProfilePicture');

  @override
  bool get isChangingProfilePicture {
    _$isChangingProfilePictureAtom.reportRead();
    return super.isChangingProfilePicture;
  }

  @override
  set isChangingProfilePicture(bool value) {
    _$isChangingProfilePictureAtom
        .reportWrite(value, super.isChangingProfilePicture, () {
      super.isChangingProfilePicture = value;
    });
  }

  final _$newImageAtom = Atom(name: '_ProfileViewModelBase.newImage');

  @override
  String get newImage {
    _$newImageAtom.reportRead();
    return super.newImage;
  }

  @override
  set newImage(String value) {
    _$newImageAtom.reportWrite(value, super.newImage, () {
      super.newImage = value;
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
  void _changeLoadingStar() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase._changeLoadingStar');
    try {
      return super._changeLoadingStar();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void photoChanging() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.photoChanging');
    try {
      return super.photoChanging();
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
isLoadingPageData: ${isLoadingPageData},
imageProfileUrl: ${imageProfileUrl},
starValue: ${starValue},
percentValue: ${percentValue},
isLoadingStar: ${isLoadingStar},
isChangingProfilePicture: ${isChangingProfilePicture},
newImage: ${newImage}
    ''';
  }
}
