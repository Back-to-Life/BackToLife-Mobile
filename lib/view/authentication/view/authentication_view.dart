import '../../../core/init/image/lottie_constants.dart';
import '../../widgets/loading/loading_page.dart';
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

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  _AuthenticationViewState createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: LocaleKeys.login_tab1.tr(),
    ),
    Tab(text: LocaleKeys.login_tab2.tr()),
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

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
                      ? context.height * 0.3
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
                      ? context.height * 0.27
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
                      ? context.height * 0.35
                      : context.height * 0.4,
                  margin: EdgeInsets.only(bottom: context.mediumValue),
                  child: Center(
                      child:
                          Lottie.asset(LottiePaths.instance!.loginPageLottie)),
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
                        child: TabBarView(
                          controller: _tabController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            buildForm(viewModel, context),
                            buildSignUpForm(viewModel, context)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                buildLoginSignUpButton(context, viewModel),
                buildOrSignUpWith(context, viewModel),
                Positioned(
                    bottom: context.height * 0.04,
                    left: context.width * 0.25,
                    child: InkWell(
                      onTap: () async {
                        print('facebook');
                        showAlertDialog(context, viewModel);
                        //viewModel.context.locale = Locale('en', 'US');
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
                        print('google');
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

  showAlertDialog(BuildContext context, AuthenticationViewModel viewModel) {
    // set up the button
    Widget okButton = TextButton(
      child: Text('OK', style: TextStyle(color: context.colors.primaryVariant)),
      onPressed: () {
        print('ok success coming buttonu');
        Navigator.of(context).pop();
      },
    );

    Widget errorButton = TextButton(
      child: Observer(builder: (_) {
        return Visibility(
          visible: viewModel.isLoading ? false : true,
          child: Text('Upps..',
              style: TextStyle(color: context.colors.primaryVariant)),
        );
      }),
      onPressed: () {
        print('error coming buttonu');
        Navigator.of(context).pop();
      },
    );

    Widget listenerButton = Observer(
      builder: (_) {
        return (viewModel.isSuccess && !viewModel.isLoading)
            ? okButton
            : errorButton;
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      elevation: context.mediumValue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.mediumValue)),
      title: Observer(builder: (_) {
        return viewModel.isLoading
            ? Text('Loading')
            : Text('Upps.. Something Went Wrong');
      }),
      content: Observer(builder: (_) {
        return viewModel.isLoading
            ? Lottie.asset(LottiePaths.instance!.loadingPageContainer)
            : Lottie.asset(LottiePaths.instance!.errorLottie);
      }),
      actions: [
        listenerButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Positioned buildOrSignUpWith(
      BuildContext context, AuthenticationViewModel viewModel) {
    return Positioned(
      left: context.width * 0.4,
      bottom: context.height * 0.1,
      child: InkWell(
        onTap: () {
          _tabController!.animateTo((_tabController!.index + 1) % 2);
          viewModel.changedTabBar();
        },
        child: Visibility(
            visible: context.mediaQuery.viewInsets.bottom > 0 ? false : true,
            child: Center(child: Observer(builder: (_) {
              return Text(
                viewModel.isLoginOrSignUp
                    ? LocaleKeys.login_orSignUpWith.tr()
                    : LocaleKeys.login_orLoginWith.tr(),
                style: context.textTheme.bodyText1!.copyWith(
                    color: context.colors.primaryVariant,
                    fontWeight: FontWeight.bold),
              );
            }))),
      ),
    );
  }

  Widget buildLoginSignUpButton(
      BuildContext context, AuthenticationViewModel viewModel) {
    return Observer(builder: (_) {
      return Visibility(
        visible: context.mediaQuery.viewInsets.bottom > 0 ? false : true,
        child: GestureDetector(
          onTap: () {
            showAlertDialog(context, viewModel);
            viewModel.isLoginOrSignUp
                ? viewModel.fetchLoginService()
                : viewModel.fetchSignUpService();
          },
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
              child: Center(
                  child: viewModel.isLoading
                      ? LoadingPage()
                      : SvgPicture.asset(
                          SVGImagePaths.instance.arrowRightLogin,
                        )),
            ),
          ),
        ),
      );
    });
  }

  Form buildSignUpForm(
      AuthenticationViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formSignUpState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Expanded(flex: 1, child: buildTabBar(viewModel, context)),
          Spacer(flex: 1),
          Expanded(flex: 2, child: buildNameSign(context, viewModel)),
          Expanded(flex: 2, child: buildSignEmail(context, viewModel)),
          Expanded(flex: 2, child: buildSignPassword(context, viewModel)),
          Expanded(flex: 1, child: buildForgotPassword(context)),
          Spacer(flex: 1),
        ],
      ),
    );
  }

  Widget buildSignPassword(
      BuildContext context, AuthenticationViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordSignUpController,
        obscureText: !viewModel.isEyeOpen,
        validator: (value) => value!.isEmpty ? 'This field required' : null,
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
            labelStyle: context.textTheme.headline6!
                .copyWith(color: context.colors.primaryVariant),
            icon: buildContainerIconField(context, Icons.lock)),
      );
    });
  }

  TextFormField buildSignEmail(
      BuildContext context, AuthenticationViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailSignUpController,
      validator: (value) => value!.isValidEmail,
      decoration: InputDecoration(
          labelText: LocaleKeys.login_email.tr(),
          labelStyle: context.textTheme.headline6!
              .copyWith(color: context.colors.primaryVariant),
          icon: buildContainerIconField(context, Icons.email)),
    );
  }

  TextFormField buildNameSign(
      BuildContext context, AuthenticationViewModel viewModel) {
    return TextFormField(
      controller: viewModel.nameSurnameController,
      validator: (value) => value!.isEmpty ? 'This field is not empty' : null,
      decoration: InputDecoration(
          labelText: LocaleKeys.login_name.tr(),
          labelStyle: context.textTheme.headline6!
              .copyWith(color: context.colors.primaryVariant),
          icon: buildContainerIconField(context, Icons.person)),
    );
  }

  Form buildForm(AuthenticationViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Expanded(flex: 1, child: buildTabBar(viewModel, context)),
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
              print('forgat password Button');
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                LocaleKeys.login_forgotText.tr(),
                style: context.textTheme.bodyText1!.copyWith(
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
        validator: (value) => value!.isEmpty ? 'This field required' : null,
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
            labelStyle: context.textTheme.headline6!
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
      validator: (value) => value!.isValidEmail,
      decoration: InputDecoration(
          labelText: LocaleKeys.login_email.tr(),
          labelStyle: context.textTheme.headline6!
              .copyWith(color: context.colors.primaryVariant),
          icon: buildContainerIconField(context, Icons.email)),
    );
  }

  TabBar buildTabBar(AuthenticationViewModel viewModel, BuildContext context) {
    return TabBar(
      controller: _tabController,
      labelStyle: context.textTheme.bodyText1!
          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      unselectedLabelStyle: context.textTheme.bodyText1!
          .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
      labelPadding: context.paddingLowHorizontal,
      labelColor: context.colors.primaryVariant,
      indicatorSize: TabBarIndicatorSize.tab,
      physics: NeverScrollableScrollPhysics(),
      onTap: (index) => viewModel.changedTabBar(),
      tabs: myTabs,
    );
  }
}
