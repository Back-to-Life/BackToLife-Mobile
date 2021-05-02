import '../../../../../core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../core/init/svgPath/image_path_svg.dart';
import '../../../../widgets/slideAnimation/slide_animation_list.dart';
import '../viewModel/language_settings_view_model.dart';

class LanguageSettingsView extends StatefulWidget {
  const LanguageSettingsView({Key? key}) : super(key: key);

  @override
  _LanguageSettingsViewState createState() => _LanguageSettingsViewState();
}

class _LanguageSettingsViewState extends State<LanguageSettingsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<LanguageViewModel>(
        viewModel: LanguageViewModel(),
        onModelReady: (LanguageViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, _viewModel) => Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: context.colors.background,
                            borderRadius: context.highOnlyBottomRadius),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    icon: Icon(Icons.arrow_back_ios,
                                        color: Colors.white),
                                    onPressed: _viewModel.backButtonLanguage)),
                            Expanded(
                                flex: 3,
                                child: Text(LocaleKeys.settings_language.tr(),
                                    style: context.textTheme.headline5!
                                        .copyWith(
                                            color: context.colors.surface))),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: context.mediumValue),
                            width: double.infinity,
                            height: context.height * 0.09,
                            child: ListTile(
                              onTap: () => _viewModel.changeLanguage(0),
                              leading: Observer(builder: (_) {
                                return CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.transparent,
                                    child: !_viewModel.isTurkishLanguage
                                        ? SvgPicture.asset(SVGImagePaths
                                            .instance.selectedLanguage)
                                        : null);
                              }),
                              title: Text(LocaleKeys.settings_english.tr()),
                              trailing: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  child: SvgPicture.asset(SVGImagePaths
                                      .instance.englishSettingsLanguage)),
                            )),
                        Divider(height: 10),
                        Container(
                            width: double.infinity,
                            height: context.height * 0.09,
                            child: ListTile(
                              onTap: () => _viewModel.changeLanguage(1),
                              leading: Observer(builder: (_) {
                                return CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.transparent,
                                    child: _viewModel.isTurkishLanguage
                                        ? SvgPicture.asset(SVGImagePaths
                                            .instance.selectedLanguage)
                                        : null);
                              }),
                              title: Text(LocaleKeys.settings_turkish.tr()),
                              trailing: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  child: SvgPicture.asset(SVGImagePaths
                                      .instance.turkishSettingsLanguage)),
                            )),
                        Divider(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
