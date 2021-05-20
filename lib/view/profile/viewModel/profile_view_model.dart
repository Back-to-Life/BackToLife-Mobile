import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  late final _fireStorage = FirebaseStorage.instance;
  late final image = ImagePicker();
  @observable
  late PickedFile pickedFile;

  @observable
  String? downloadUrl;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  @action
  Future<void> uploadImageFirebase() async {
    var pickedFile = await image.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      var file = File(pickedFile.path);
      // Getting File Path
      var fileName = file.uri.path.split('/').last;

      // Uploading Image to FirebaseStorage
      var filePath = await _fireStorage
          .ref()
          .child('demo/$fileName')
          .putFile(file)
          .then((value) {
        return value;
      });
      // Getting Uploaded Image Url
      var downloadUrl = await filePath.ref.getDownloadURL();
      print(downloadUrl);
    }
  }
}
