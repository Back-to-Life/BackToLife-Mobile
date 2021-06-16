import 'package:backtolife/core/base/model/base_view_model.dart';
import 'package:backtolife/core/constants/navigation/navigation_constants.dart';
import 'package:backtolife/core/extension/context_extension.dart';
import 'package:backtolife/core/extension/string_extension.dart';
import 'package:backtolife/core/init/lang/locale_keys.g.dart';
import 'package:backtolife/core/init/notifier/forgot_password.dart';
import 'package:backtolife/core/init/svgPath/lottie_path.dart';
import 'package:backtolife/view/authentication/forgotpassword/model/email_toke_model/email_token_request_model.dart';
import 'package:backtolife/view/authentication/forgotpassword/service/forgot_service.dart';
import 'package:backtolife/view/widgets/showAlertDialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'forgot_password_view_model.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModelBase
    with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formStateEmail = GlobalKey();
  GlobalKey<FormState> formStateToken = GlobalKey();
  GlobalKey<FormState> formState2 = GlobalKey();
  late TextEditingController email = TextEditingController();
  late TextEditingController token = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController returnPassword = TextEditingController();
  late ForgotService forgotService;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    forgotService = ForgotService(dio);
  }

  @observable
  double opacityValue = 0;

  @observable
  bool visible = false;

  @observable
  String? emailString;

  @observable
  String? passwordString;

  @observable
  int? tokenInt;

  @action
  void changedOpacity() {
    opacityValue = 1;
    visible = true;
  }

  @observable
  bool tokenSendService = false;

  @action
  Future<void> firstEmailGetToken() async {
    if (formStateEmail.currentState!.validate()) {
      var _response = await forgotService.emailSend(email.text.toString());
      if (_response is String) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(_response)));
      } else if (_response is bool) {
        emailString = email.text.toString();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(LocaleKeys.login_emailsend.locale,
                style: context.textTheme.headline5!
                    .copyWith(color: Colors.black))));
        changedOpacity();
        tokenSendService = true;
      }
    }
  }

  @action
  void changePage() {
    if (formStateToken.currentState!.validate()) {
      navigate();
      tokenInt = int.parse(token.text.toString());
    }
  }

  Future<void> changeMaybe() async {
    await navigation.pop();
  }

  @action
  Future<void> sendPasswordAndToken() async {
    if (formState2.currentState!.validate()) {
      print(Provider.of<ForgotPasswordNotifier>(context, listen: false).email);

      print(Provider.of<ForgotPasswordNotifier>(context, listen: false).token);
      passwordString = returnPassword.text.toString();
      print(passwordString);
      var _lastresponse = await forgotService.emailTokenPassword(
          EmailTokenRequestModel(
              email: Provider.of<ForgotPasswordNotifier>(context, listen: false)
                  .email,
              forgotCode:
                  Provider.of<ForgotPasswordNotifier>(context, listen: false)
                      .token,
              password: passwordString!));
      if (_lastresponse is bool) {
        showSuccess();
        Future.delayed(const Duration(seconds: 2), () {
          navigation.navigateToPageClear(
              path: NavigationConstants.AUTHENTICATION_VIEW);
        });
      } else if (_lastresponse is String) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          _lastresponse,
          style: context.textTheme.headline5!.copyWith(color: Colors.black),
        )));
        Future.delayed(const Duration(seconds: 2), () {
          navigation.pop();
        });
      }
    }
  }

  @action
  void navigate() {
    tokenInt = int.parse(token.text.toString());
    emailString = email.text.toString();
    context
        .read<ForgotPasswordNotifier>()
        .setEmailToken(emailString!, tokenInt!);
    navigation.navigateToPage(path: NavigationConstants.PASSOWRD_CHANGE);
  }

  @action
  showSuccess() {
    // set up the AlertDialog
    // ignore: omit_local_variable_types
    AlertDialog alert = AlertDialog(
        title: Text(LocaleKeys.login_passwordchangesuccess.locale),
        content: Lottie.asset(LottiePaths.instance.successPasswordChange,
            repeat: false, reverse: false));

    // show the dialog
    // ignore: unawaited_futures
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
