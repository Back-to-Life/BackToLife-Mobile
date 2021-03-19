import 'package:backtolife/core/constants/enum/locale_keys_enum.dart';
import 'package:backtolife/core/constants/navigation/navigation_constants.dart';
import 'package:backtolife/core/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import '../model/on_board_model.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentIndex = 0;

  @observable
  bool isLoading = false;

  void init() {
    onBoardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page1_title.locale,
        LocaleKeys.onBoard_page1_desc.locale,
        SVGImagePaths.instance.onboarding1));
    onBoardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page2_title.locale,
        LocaleKeys.onBoard_page2_desc.locale,
        SVGImagePaths.instance.onboarding2));
    onBoardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page3_title.locale,
        LocaleKeys.onBoard_page3_desc.locale,
        SVGImagePaths.instance.onboarding3));
  }

  @action
  void changedCurrentIndex(int value) {
    currentIndex = value;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    if (currentIndex == 2) {
      changeLoading();
      await localeManager.setBooleanValue(PreferencesKeys.IS_FIRST_APP, true);
      changeLoading();
      navigation.navigateToPageClear(path: NavigationConstants.HOME_VIEW);
    }
  }
}
