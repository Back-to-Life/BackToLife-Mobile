import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../core/extension/string_extension.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../../core/init/notifier/theme_notifier.dart';
import '../../../../../core/init/svgPath/image_path_svg.dart';
import '../../../../widgets/upperSettingsContainer/upper_settings_container.dart';
import '../viewModel/account_settings_view_model.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AccountSettingsViewModel>(
        viewModel: AccountSettingsViewModel(),
        onModelReady: (AccountSettingsViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, _viewModel) => Scaffold(
                body: SingleChildScrollView(
              child: Container(
                height: context.height * 1,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: UpperContainerSettings(
                            title: LocaleKeys.settings_account.locale)),
                    Expanded(flex: 8, child: buildForm(_viewModel, context))
                  ],
                ),
              ),
            )));
  }

  Widget buildForm(AccountSettingsViewModel _viewModel, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Expanded(flex: 2, child: _upperContainer(context)),
        Expanded(flex: 2, child: _accountSettingsTitle(context)),
        Spacer(),
        Expanded(flex: 3, child: _buildUserName(context, _viewModel)),
        Spacer(),
        Expanded(flex: 3, child: _buildEmail(context, _viewModel)),
        Spacer(flex: 4),
        Expanded(flex: 2, child: _submitButton(context, _viewModel)),
        Spacer(flex: 3)
      ],
    );
  }

  ConstrainedBox _submitButton(
      BuildContext context, AccountSettingsViewModel _viewModel) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: context.width * 0.5),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFFFDE52)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: context.normalBorderRadius,
            )),
          ),
          onPressed: () => _viewModel.changeNameAndEmail(),
          child: Text(
            LocaleKeys.settings_accountSettings_submit.locale,
            style: context.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w400, color: context.colors.secondary),
          )),
    );
  }

  Padding _upperContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.width * 0.1, right: context.width * 0.2),
      child: Container(
        color: Color(0xFFFFDE52),
        child: Center(
            child: Text(
          LocaleKeys.settings_accountSettings_title1.locale,
          style: context.textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.read<ThemeNotifier>().isDark
                  ? Colors.white
                  : context.colors.secondary),
        )),
      ),
    );
  }

  Padding _accountSettingsTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.width * 0.2, right: context.width * 0.1),
      child: Container(
        color: Color(0xFFFFDE52),
        child: Center(
            child: Text(
          LocaleKeys.settings_accountSettings_title2.locale,
          style: context.textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.read<ThemeNotifier>().isDark
                  ? Colors.white
                  : context.colors.secondary),
        )),
      ),
    );
  }

  Widget _buildUserName(
      BuildContext context, AccountSettingsViewModel _viewModel) {
    return Form(
      key: _viewModel.formStateAccount,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: context.paddingMediumHorizontal,
        child: ClipRRect(
          borderRadius: context.normalBorderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: context.read<ThemeNotifier>().isDark
                    ? Colors.white.withOpacity(0.3)
                    : Color(0xFFE0E1BE),
                borderRadius: context.normalBorderRadius,
              ),
              child: Padding(
                padding: context.paddingNormal,
                child: TextFormField(
                  style: TextStyle(
                      color: context.read<ThemeNotifier>().isDark
                          ? Colors.white
                          : Color(0xFF4E5F49)),
                  controller: _viewModel.userName,
                  decoration: InputDecoration(
                      hintStyle: context.textTheme.headline5!.copyWith(
                          color: context.read<ThemeNotifier>().isDark
                              ? Colors.white
                              : Color(0xFF4E5F49)),
                      hintText:
                          LocaleKeys.settings_accountSettings_userName.locale,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      icon: Padding(
                        padding: EdgeInsets.only(left: context.width * 0.03),
                        child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SvgPicture.asset(
                                SVGImagePaths.instance.workerIcon)),
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmail(
      BuildContext context, AccountSettingsViewModel _viewModel) {
    return Form(
      key: _viewModel.formStateEmail,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: context.paddingMediumHorizontal,
        child: ClipRRect(
          borderRadius: context.normalBorderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: context.read<ThemeNotifier>().isDark
                    ? Colors.white.withOpacity(0.3)
                    : Color(0xFFE0E1BE),
                borderRadius: context.normalBorderRadius,
              ),
              child: Padding(
                padding: context.paddingNormal,
                child: TextFormField(
                  controller: _viewModel.email,
                  validator: (value) => value!.isValidEmail,
                  decoration: InputDecoration(
                      hintStyle: context.textTheme.headline5!.copyWith(
                          color: context.read<ThemeNotifier>().isDark
                              ? Colors.white
                              : Color(0xFF4E5F49)),
                      hintText:
                          LocaleKeys.settings_accountSettings_email.locale,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      icon: Padding(
                        padding: EdgeInsets.only(left: context.width * 0.03),
                        child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SvgPicture.asset(
                                SVGImagePaths.instance.emailAccountIcon)),
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.highValue)),
      padding: context.paddingLow,
      child: Icon(icon),
    );
  }
}
