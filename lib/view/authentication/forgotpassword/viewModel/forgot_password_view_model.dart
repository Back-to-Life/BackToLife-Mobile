import 'package:backtolife/core/base/model/base_view_model.dart';
import 'package:backtolife/core/constants/navigation/navigation_constants.dart';
import 'package:backtolife/core/extension/context_extension.dart';
import 'package:backtolife/core/init/notifier/forgot_password.dart';
import 'package:backtolife/core/init/svgPath/lottie_path.dart';
import 'package:backtolife/view/authentication/forgotpassword/model/email_toke_model/email_token_request_model.dart';
import 'package:backtolife/view/authentication/forgotpassword/service/forgot_service.dart';
import 'package:backtolife/view/widgets/showAlertDialog/alert_dialog.dart';
import 'package:flutter/material.dart';
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

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('E-mail başarıyla gönderildi')));
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
      /*  print(Provider.of<ForgotPasswordNotifier>(context, listen: false).email);

      print(Provider.of<ForgotPasswordNotifier>(context, listen: false).token); */
      passwordString = returnPassword.text.toString();
      print(passwordString);
      var _lastresponse = await forgotService.emailTokenPassword(
          /* EmailTokenRequestModel(
              email: Provider.of<ForgotPasswordNotifier>(context, listen: false)
                  .email,
              forgotCode:
                  Provider.of<ForgotPasswordNotifier>(context, listen: false)
                      .token,
              password: passwordString!) */
          EmailTokenRequestModel(
              email:
                  'fatihkur53@hotmail.com', //verileri üsttekiler ile değiştirilmesi gerekmektedir.
              forgotCode: 597739,
              password: passwordString!));
      if (_lastresponse is bool) {
        showSuccess();
        //TODO 3 saniye sonrasında geçilcek ve authenticationview geçmesi sağlanacaktır.
      } else if (_lastresponse is String) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          _lastresponse,
          style: context.textTheme.headline5!.copyWith(color: Colors.black),
        )));
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
  showSuccess() async {
    // set up the button
    Widget okButton = ElevatedButton(
        child: Text('Kabul ediyorum',
            style: context.textTheme.subtitle1!.copyWith(color: Colors.black)),
        onPressed: () async {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Sözleşme kabul edildi. Lütfen kayıt olurken bekleyeyiniz',
                style:
                    context.textTheme.headline5!.copyWith(color: Colors.black),
              ),
            ),
          );
        }
        //

        );

    // set up the AlertDialog
    // ignore: omit_local_variable_types
    AlertDialog alert = AlertDialog(
      title: Text('Kullanıcı verileri Sözleşmesi'),
      content: Text('başarılı'),
      actions: [
        okButton,
      ],
    );

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
