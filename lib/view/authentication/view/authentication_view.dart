import 'package:backtolife/core/init/image/lottie_constants.dart';
import 'package:backtolife/view/widgets/loading/loading_page.dart';
import 'package:lottie/lottie.dart';

import '../../../core/extension/string_extension.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import '../viewModel/authentication_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/init/lang/locale_keys.g.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthenticationViewModel>(
      viewModel: AuthenticationViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, AuthenticationViewModel viewModel) =>
              DefaultTabController(
        length: 2,
        child: Scaffold(
            key: viewModel.scaffoldState,
            body: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  height: context.mediaQuery.viewInsets.bottom > 0
                      ? context.height * 0.25
                      : context.height * 0.4,
                  margin: EdgeInsets.only(bottom: context.mediumValue),
                  decoration: BoxDecoration(
                      color: context.colors.onSecondary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(context.mediumValue),
                          bottomRight: Radius.circular(context.mediumValue))),
                  child: Center(
                      child: Padding(
                    padding: context.paddingMedium,
                  )),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  height: context.mediaQuery.viewInsets.bottom > 0
                      ? context.height * 0.3
                      : context.height * 0.35,
                  decoration: BoxDecoration(
                      color: context.colors.primaryVariant,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(context.mediumValue),
                          bottomRight: Radius.circular(context.mediumValue))),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  height: context.mediaQuery.viewInsets.bottom > 0
                      ? context.height * 0.27
                      : context.height * 0.4,
                  margin: EdgeInsets.only(bottom: context.mediumValue),
                  child: Center(
                      child: Padding(
                    padding: context.paddingMedium,
                    child: SvgPicture.asset(SVGImagePaths.instance.onboarding1),
                  )),
                ),
                SingleChildScrollView(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: context.height * 0.35),
                      decoration: BoxDecoration(
                          color: context.colors.primary,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: context.lowValue,
                              blurRadius: context.lowValue,
                            )
                          ],
                          borderRadius:
                              BorderRadius.circular(context.highValue)),
                      height: context.height * 0.45,
                      width: context.width * 0.9,
                      child: Padding(
                        padding: context.paddingMediumHorizontal,
                        child: buildForm(viewModel, context),
                      ),
                    ),
                  ),
                ),
                buildLoginSignUpButton(context, viewModel),
                Positioned(
                  left: context.width * 0.4,
                  bottom: context.height * 0.1,
                  child: Visibility(
                      visible: context.mediaQuery.viewInsets.bottom > 0
                          ? false
                          : true,
                      child: Center(
                          child: Text(LocaleKeys.login_orSignUpWith).tr())),
                ),
                Positioned(
                    bottom: context.height * 0.04,
                    left: context.width * 0.25,
                    child: InkWell(
                      onTap: () async {
                        print("facebook");
                        viewModel.context.locale = Locale('en', 'US');
                      },
                      child: Visibility(
                        visible: context.mediaQuery.viewInsets.bottom > 0
                            ? false
                            : true,
                        child: Container(
                          width: context.height * 0.05,
                          height: context.height * 0.05,
                          child: SvgPicture.asset(
                              SVGImagePaths.instance.facebookIcon),
                        ),
                      ),
                    )),
                Positioned(
                    bottom: context.height * 0.04,
                    right: context.width * 0.25,
                    child: InkWell(
                      onTap: () {
                        print("google");
                      },
                      child: Visibility(
                        visible: context.mediaQuery.viewInsets.bottom > 0
                            ? false
                            : true,
                        child: Container(
                          width: context.height * 0.05,
                          height: context.height * 0.05,
                          child: SvgPicture.asset(
                              SVGImagePaths.instance.googleIcon),
                        ),
                      ),
                    )),
              ],
            )),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
        title: Text("My title"),
        content: Lottie.asset(LottiePaths.instance.loadingPageContainer));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget buildLoginSignUpButton(
      BuildContext context, AuthenticationViewModel viewModel) {
    return Visibility(
      visible: context.mediaQuery.viewInsets.bottom > 0 ? false : true,
      child: GestureDetector(
        onTap: () => viewModel.fetchLoginService(),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: context.height * 0.6),
            decoration: BoxDecoration(
                color: context.colors.secondaryVariant,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: context.lowValue,
                      blurRadius: context.lowValue,
                      offset: Offset(0, context.lowValue))
                ],
                borderRadius: BorderRadius.circular(context.highValue)),
            height: context.height * 0.1,
            width: context.width * 0.2,
            child: Observer(builder: (_) {
              return Center(
                  child: viewModel.isLoading
                      ? LoadingPage()
                      : SvgPicture.asset(
                          SVGImagePaths.instance.arrowRightLogin,
                        ));
            }),
          ),
        ),
      ),
    );
  }

  Form buildForm(AuthenticationViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Expanded(flex: 1, child: buildTabBar(context)),
          Spacer(flex: 1),
          Expanded(flex: 2, child: buildEmail(context, viewModel)),
          Expanded(flex: 2, child: buildPassword(context, viewModel)),
          Expanded(flex: 1, child: buildForgotPassword(context)),
          Spacer(flex: 1),
        ],
      ),
    );
  }

  Column buildForgotPassword(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              print("forgat password Button");
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                LocaleKeys.login_forgotText.tr(),
                style: context.textTheme.bodyText1.copyWith(
                    color: context.colors.primaryVariant,
                    fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }

  Widget buildPassword(
      BuildContext context, AuthenticationViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        obscureText: !viewModel.isEyeOpen,
        validator: (value) => value.isEmpty ? "This field required" : null,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () => viewModel.isEyeOpenFun(),
              child: Observer(builder: (_) {
                return Icon(
                    viewModel.isEyeOpen
                        ? Icons.remove_red_eye_sharp
                        : Icons.visibility_off,
                    color: context.colors.primaryVariant);
              }),
            ),
            labelText: LocaleKeys.login_password.tr(),
            labelStyle: context.textTheme.headline6
                .copyWith(color: context.colors.primaryVariant),
            icon: buildContainerIconField(context, Icons.lock)),
      );
    });
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: context.colors.onSecondary,
          borderRadius: BorderRadius.circular(context.lowValue)),
      padding: context.paddingLow,
      child: Icon(icon),
    );
  }

  TextFormField buildEmail(
      BuildContext context, AuthenticationViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value.isValidEmail,
      decoration: InputDecoration(
          labelText: LocaleKeys.login_email.tr(),
          labelStyle: context.textTheme.headline6
              .copyWith(color: context.colors.primaryVariant),
          icon: buildContainerIconField(context, Icons.email)),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      labelStyle: context.textTheme.bodyText1
          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      unselectedLabelStyle: context.textTheme.bodyText1
          .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
      labelPadding: context.paddingLowHorizontal,
      labelColor: context.colors.primaryVariant,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(
          text: LocaleKeys.login_tab1.tr(),
        ),
        Tab(text: LocaleKeys.login_tab2.tr()),
      ],
    );
  }
}
