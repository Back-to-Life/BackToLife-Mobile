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

  final _$uploadImageFirebaseAsyncAction =
      AsyncAction('_ProfileViewModelBase.uploadImageFirebase');

  @override
  Future<void> uploadImageFirebase() {
    return _$uploadImageFirebaseAsyncAction
        .run(() => super.uploadImageFirebase());
  }

  @override
  String toString() {
    return '''
pickedFile: ${pickedFile},
downloadUrl: ${downloadUrl}
    ''';
  }
}
