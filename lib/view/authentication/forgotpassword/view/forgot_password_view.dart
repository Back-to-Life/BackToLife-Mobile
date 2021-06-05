import 'dart:ui';

import 'package:backtolife/core/init/lang/locale_keys.g.dart';
import 'package:backtolife/core/init/svgPath/image_path_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../../../../core/init/svgPath/lottie_path.dart';
import '../viewModel/forgot_password_view_model.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView>
    with SingleTickerProviderStateMixin {
  late Animation _rightSecondSlidingAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _rightSecondSlidingAnimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.25, 1, curve: Curves.fastOutSlowIn)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
      viewModel: ForgotPasswordViewModel(),
      onModelReady: (model) {
        model.setContext(context);
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              height: context.height * 1,
              width: context.width * 1,
              child: Column(
                children: [
                  Expanded(
                      flex: 5,
                      child: Center(
                        child: Container(
                            width: context.width * 0.8,
                            child: LottieBuilder.asset(
                                LottiePaths.instance.forgotPassword)),
                      )),
                  Spacer(flex: 1),
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Forgot your password ?',
                        style: context.textTheme.headline5!.copyWith(
                            color: Color(0xFF578B49),
                            fontWeight: FontWeight.bold),
                      )),
                  Spacer(flex: 1),
                  Expanded(flex: 2, child: _buildEmail(context, _viewModel)),
                  Spacer(flex: 1),
                  Expanded(
                      flex: 2,
                      child: Observer(builder: (_) {
                        return AnimatedBuilder(
                          animation: _rightSecondSlidingAnimation,
                          child: AnimatedOpacity(
                              opacity: _viewModel.opacityValue,
                              duration: const Duration(seconds: 6),
                              child: _buildToken(context, _viewModel)),
                          builder: (BuildContext context, Widget? child) {
                            return Transform(
                                transform: Matrix4.translationValues(
                                    _rightSecondSlidingAnimation.value *
                                        context.width,
                                    0,
                                    0),
                                child: child);
                          },
                        );
                      })),
                  Spacer(flex: 2),
                  Expanded(
                      child: Visibility(
                    visible:
                        context.mediaQuery.viewInsets.bottom > 0 ? false : true,
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
                        _animationController.forward();
                        _viewModel.firstEmailGetToken();
                        _viewModel.navigate();
                      },
                      child: Text(
                          LocaleKeys.settings_accountSettings_submit.locale,
                          style: context.textTheme.headline6!
                              .copyWith(color: Colors.white)),
                    ),
                  )),
                  Spacer(flex: 1)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmail(BuildContext context, ForgotPasswordViewModel _viewModel) {
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
                style: context.textTheme.headline5!
                    .copyWith(color: Color(0xFF4E5F49)),
                controller: _viewModel.email,
                validator: (value) => value!.isValidEmail,
                decoration: InputDecoration(
                    hintStyle: context.textTheme.headline5!.copyWith(
                      color: Color(0xFF4E5F49),
                    ),
                    hintText: LocaleKeys.settings_accountSettings_email.locale,
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
    );
  }

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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
