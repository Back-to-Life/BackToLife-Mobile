import 'package:backtolife/core/extension/context_extension.dart';
import 'package:backtolife/core/init/lang/locale_keys.g.dart';
import 'package:backtolife/core/init/notifier/theme_notifier.dart';
import 'package:backtolife/core/init/svgPath/image_path_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/base/view/base_view.dart';
import '../viewModel/theme_settings_view_model.dart';

class ThemeSettingsView extends StatelessWidget {
  const ThemeSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ThemeSettingsViewModel>(
        viewModel: ThemeSettingsViewModel(),
        onModelReady: (ThemeSettingsViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, _viewModel) => Scaffold(
              body: Column(
                children: [
                  Expanded(
                      flex: 2, child: _upperContainer(context, _viewModel)),
                  Expanded(
                    flex: 8,
                    child: Center(
                      child: Container(
                          height: context.height * 0.5,
                          width: context.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: context.highBorderRadius,
                              color: Color(0xFFE0E1BE),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                  child: _selectedContainerLight(
                                      context, _viewModel)),
                              Expanded(
                                  child: _selectedContainerDark(
                                      context, _viewModel))
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ));
  }

  Widget _selectedContainerLight(
      BuildContext context, ThemeSettingsViewModel _viewModel) {
    return InkWell(
      onTap: _viewModel.changeToLight,
      child: Container(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: SvgPicture.asset(SVGImagePaths.instance.themelight),
            ),
            Expanded(
              child: context.read<ThemeNotifier>().isLight
                  ? SvgPicture.asset(SVGImagePaths.instance.selectedLanguage)
                  : Container(),
            ),
            Expanded(
                child: Text(LocaleKeys.settings_light.tr(),
                    style: context.textTheme.bodyText1!
                        .copyWith(color: Colors.black54))),
          ],
        ),
      ),
    );
  }

  Widget _selectedContainerDark(
      BuildContext context, ThemeSettingsViewModel _viewModel) {
    return InkWell(
      onTap: _viewModel.changeToDark,
      child: Container(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: SvgPicture.asset(SVGImagePaths.instance.themedark),
            ),
            Expanded(
              child: context.read<ThemeNotifier>().isDark
                  ? SvgPicture.asset(SVGImagePaths.instance.selectedLanguage)
                  : Container(),
            ),
            Expanded(
                child: Text(LocaleKeys.settings_dark.tr(),
                    style: context.textTheme.bodyText1!
                        .copyWith(color: Colors.black54))),
          ],
        ),
      ),
    );
  }

  Container _upperContainer(
      BuildContext context, ThemeSettingsViewModel _viewModel) {
    return Container(
      decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: context.highOnlyBottomRadius),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.pop(context))),
          Expanded(
              flex: 3,
              child: Text(LocaleKeys.settings_theme.tr(),
                  style: context.textTheme.headline5!
                      .copyWith(color: context.colors.surface))),
        ],
      ),
    );
  }
}
