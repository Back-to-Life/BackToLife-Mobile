import 'package:easy_localization/easy_localization.dart';
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
  void init() {
    onBoardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page1_title.tr(),
        LocaleKeys.onBoard_page1_desc.tr(),
        SVGImagePaths.instance.onboarding1));
    onBoardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page2_title.tr(),
        LocaleKeys.onBoard_page2_desc.tr(),
        SVGImagePaths.instance.onboarding2));
    onBoardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page3_title.tr(),
        LocaleKeys.onBoard_page3_desc.tr(),
        SVGImagePaths.instance.onboarding3));
  }
}
