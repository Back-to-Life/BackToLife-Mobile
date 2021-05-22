import 'dart:io';

import 'package:backtolife/core/extension/string_extension.dart';
import 'package:backtolife/core/init/lang/locale_keys.g.dart';
import 'package:backtolife/core/init/svgPath/lottie_path.dart';
import 'package:backtolife/view/profile/model/profile_model/profile_model.dart';
import 'package:backtolife/view/profile/model/profile_update_request_model.dart';
import 'package:backtolife/view/profile/service/profile_service.dart';
import 'package:backtolife/view/widgets/showAlertDialog/alert_dialog.dart';
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
  late final ProfileService service;
  late UserProfileModel userProfileModel = UserProfileModel();

  @observable
  late PickedFile pickedFile;

  @observable
  String? downloadUrl;

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingPageData = false;

  @observable
  String? imageProfileUrl;

  @observable
  int? starValue;

  @observable
  double? percentValue;

  @observable
  bool isLoadingStar = false;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    service = ProfileService(dio);
    _getProfileData();
  }

  @action
  Future<void> uploadImageFirebase() async {
    var pickedFile = await image.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      var file = File(pickedFile.path);
      // Getting File Path
      var fileName = file.uri.path.split('/').last;
      _changeLoading();
      // Uploading Image to FirebaseStorage
      var filePath = await _fireStorage
          .ref()
          .child('demo/$fileName')
          .putFile(file)
          .then((value) {
        return value;
      });
      // Getting Uploaded Image Url
      downloadUrl = await filePath.ref.getDownloadURL();
      _changeLoading();
      print(downloadUrl);
      if (downloadUrl != null) {
        await _changeDatabaseUrl(downloadUrl!);
      } else {
        await showDialog(
            context: context,
            builder: (context) => CustomConfirmDialog(
                title: 'Servis hatası',
                description: 'Serviste kaydedilirken bir hata oluştu opps..',
                jsonPath: LottiePaths.instance.errorLottie));
      }
    }
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void _changeLoadingData() {
    isLoadingPageData = !isLoadingPageData;
  }

  @action
  void _changeLoadingStar() {
    isLoadingStar = !isLoadingStar;
  }

  @action
  Future<void> _changeDatabaseUrl(String downloadUrl) async {
    var responseSuccess = await service.updateProfilePictureUrl(
        ImageUpdateRequestModel(imageUrl: downloadUrl));
    if (!responseSuccess) {
      await showDialog(
          context: context,
          builder: (context) => CustomConfirmDialog(
              title: 'Servis hatası',
              description: 'Serviste kaydedilirken bir hata oluştu opps..',
              jsonPath: LottiePaths.instance.errorLottie));
    }
  }

  @action
  Future<void> _getProfileData() async {
    _changeLoadingData();
    _changeLoadingStar();
    final _getResponse = await service.getDataProfile();
    if (_getResponse != null) {
      userProfileModel = _getResponse;
      print(userProfileModel.refreshToken);
      if ((userProfileModel.point! >= 0) && (userProfileModel.point! <= 49)) {
        starValue = 1;
        percentValue = 0.2;
      } else if ((userProfileModel.point! >= 50) &&
          (userProfileModel.point! < 60)) {
        starValue = 2;
        percentValue = 0.4;
      } else if ((userProfileModel.point! >= 60) &&
          (userProfileModel.point! < 70)) {
        starValue = 3;
        percentValue = 0.6;
      } else if ((userProfileModel.point! >= 70) &&
          (userProfileModel.point! < 85)) {
        starValue = 4;
        percentValue = 0.8;
      } else if ((userProfileModel.point! >= 85) &&
          (userProfileModel.point! <= 100)) {
        starValue = 5;
        percentValue = 1.0;
      }
    } else {
      await showDialog(
          context: context,
          builder: (context) => CustomConfirmDialog(
              title: 'Servis hatası',
              description: 'Servisteten veriler Çekilemedi !!',
              jsonPath: LottiePaths.instance.errorLottie));
    }

    _changeLoadingData();
    _changeLoadingStar();
  }
}
