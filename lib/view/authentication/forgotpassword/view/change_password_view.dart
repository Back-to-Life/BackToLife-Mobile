import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../../../../core/init/svgPath/image_path_svg.dart';
import '../../../../core/init/svgPath/lottie_path.dart';
import '../viewModel/forgot_password_view_model.dart';

class PasswordChangeView extends StatelessWidget {
  const PasswordChangeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
      viewModel: ForgotPasswordViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ForgotPasswordViewModel _viewModel) =>
              Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(context.height * 0.05),
            child: AppBar(
              iconTheme: IconThemeData(
                color: Color(0xFF72A863),
              ),
            )),
        body: SingleChildScrollView(
          child: Form(
            key: _viewModel.formState2,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              height: context.height * 1,
              width: context.width * 1,
              child: Column(
                children: [
                  Expanded(flex: 8, child: _lottieAnimationUpper(context)),
                  Expanded(flex: 1, child: _passwordTextMessage(context)),
                  Expanded(flex: 2, child: _buildPassword(context, _viewModel)),
                  Spacer(flex: 1),
                  Expanded(
                      flex: 2, child: _buildPassword2(context, _viewModel)),
                  Spacer(flex: 1),
                  Expanded(child: Observer(builder: (_) {
                    return Visibility(
                      visible: context.mediaQuery.viewInsets.bottom > 0
                          ? false
                          : true,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              Size(context.width * 0.3, context.height * 0.3)),
                          animationDuration: const Duration(milliseconds: 500),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          context.width * 0.1))),
                          elevation: MaterialStateProperty.all(5),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF72A863)),
                        ),
                        onPressed: () {
                          if (_viewModel.formState2.currentState!.validate()) {
                            _viewModel.sendPasswordAndToken();
                          } else {
                            return null;
                          }
                          // TODO showPermissions() düzelt bi yav yorulduk daaa

                          //_viewModel.changeMaybe();
                        },
                        child: Text(
                            LocaleKeys.settings_accountSettings_submit.locale,
                            style: context.textTheme.headline6!
                                .copyWith(color: Colors.white)),
                      ),
                    );
                  })),
                  Spacer(flex: 2)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text _passwordTextMessage(BuildContext context) {
    return Text(
      'New Password',
      style: context.textTheme.headline5!
          .copyWith(color: Color(0xFF578B49), fontWeight: FontWeight.bold),
    );
  }

  Center _lottieAnimationUpper(BuildContext context) {
    return Center(
      child: Container(
          width: context.width * 0.9,
          child: LottieBuilder.asset(LottiePaths.instance.passwordChange)),
    );
  }

  Widget _buildPassword(
      BuildContext context, ForgotPasswordViewModel _viewModel) {
    return Padding(
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
                enableSuggestions: true,
                obscureText: true,
                controller: _viewModel.password,
                style: context.textTheme.headline5!
                    .copyWith(color: Color(0xFF4E5F49)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen bir şifre giriniz';
                  } else if (value.length < 6) {
                    return 'Lütfen 6 haneden büyük bir değer olmalıdır';
                  }
                },
                decoration: InputDecoration(
                    hintStyle: context.textTheme.headline5!.copyWith(
                      color: Color(0xFF4E5F49),
                    ),
                    hintText: LocaleKeys.login_password.locale,
                    icon: Padding(
                      padding: EdgeInsets.only(left: context.width * 0.03),
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                              SVGImagePaths.instance.newpassword)),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPassword2(
      BuildContext context, ForgotPasswordViewModel _viewModel) {
    return Padding(
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
              child: Observer(builder: (_) {
                return TextFormField(
                  enableSuggestions: true,
                  obscureText: true,
                  style: context.textTheme.headline5!
                      .copyWith(color: Color(0xFF4E5F49)),
                  controller: _viewModel.returnPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Lütfen şifre giriniz';
                    } else if (value.length < 6) {
                      return '6 ve daha fazla karakter girmelisiniz';
                    } else if (_viewModel.password.text !=
                        _viewModel.returnPassword.text) {
                      return 'Şifreler uyuşmamaktadır';
                    }
                  },
                  decoration: InputDecoration(
                      hintStyle: context.textTheme.headline5!.copyWith(
                        color: Color(0xFF4E5F49),
                      ),
                      hintText: LocaleKeys.login_passwordA.locale,
                      icon: Padding(
                        padding: EdgeInsets.only(left: context.width * 0.03),
                        child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SvgPicture.asset(
                                SVGImagePaths.instance.newpassword)),
                      )),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
/* 
  Widget _buildToken(BuildContext context, ForgotPasswordViewModel _viewModel) {
    return Padding(
      padding: context.paddingMediumHorizontal,
      child: ClipRRect(
        borderRadius: context.normalBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE0E1BE),
              borderRadius: context.normalBorderRadius,
            ),
            child: Padding(
              padding: context.paddingNormal,
              child: TextFormField(
                enableSuggestions: true,
                style: context.textTheme.headline5!
                    .copyWith(color: Color(0xFF4E5F49)),
                controller: _viewModel.token,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Token boş olamaz';
                  }
                },
                decoration: InputDecoration(
                    hintStyle: context.textTheme.headline5!.copyWith(
                      color: Color(0xFF4E5F49),
                    ),
                    hintText: 'Token',
                    icon: Padding(
                      padding: EdgeInsets.only(left: context.width * 0.03),
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                              SVGImagePaths.instance.forgottoken)),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  } */
}
