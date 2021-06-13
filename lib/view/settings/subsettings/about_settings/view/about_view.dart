import 'dart:ui';

import 'package:backtolife/core/base/view/base_view.dart';
import 'package:backtolife/core/extension/context_extension.dart';
import 'package:backtolife/core/extension/string_extension.dart';
import 'package:backtolife/core/init/lang/locale_keys.g.dart';
import 'package:backtolife/view/settings/subsettings/about_settings/viewModel/about_settings_view_model.dart';
import 'package:backtolife/view/widgets/upperSettingsContainer/upper_settings_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AboutUsSettingsView extends StatelessWidget {
  const AboutUsSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AboutUsViewModel>(
        viewModel: AboutUsViewModel(),
        onModelReady: (AboutUsViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, _viewModel) => Scaffold(
              body: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: UpperContainerSettings(
                          title: LocaleKeys.settings_about.locale)),
                  Expanded(
                      flex: 8,
                      child: Observer(builder: (_) {
                        return _viewModel.isLoading
                            ? Center(child: CircularProgressIndicator())
                            : Scrollbar(
                                isAlwaysShown: true,
                                thickness: 6,
                                child: SingleChildScrollView(
                                  child: Center(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: context.colors.primary
                                                    .withOpacity(0.9),
                                                spreadRadius: 30,
                                                blurRadius: 50,
                                                offset: Offset(-10, 10))
                                          ],
                                        ),
                                        width: context.width * 0.8,
                                        child: Text(
                                          _viewModel.aboutUs ?? '',
                                          style: context.textTheme.headline6!
                                              .copyWith(
                                                  color:
                                                      context.colors.secondary),
                                        )),
                                  ),
                                ),
                              );
                      }))
                ],
              ),
            ));
  }
}
