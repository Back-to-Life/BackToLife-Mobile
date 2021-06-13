import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';

part 'about_settings_view_model.g.dart';

class AboutUsViewModel = _AboutUsViewModelBase with _$AboutUsViewModel;

abstract class _AboutUsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    setUserPermissions();
  }

  @observable
  bool isLoading = false;

  @observable
  String? aboutUs;

  @action
  Future<void> setUserPermissions() async {
    loading();
    aboutUs = await rootBundle.loadString('asset/permissons/aboutus.txt');
    loading();
  }

  @action
  void loading() {
    isLoading = !isLoading;
  }
}
