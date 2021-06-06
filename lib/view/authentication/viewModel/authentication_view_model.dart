import 'dart:async';

import '../../../core/constants/enum/locale_keys_enum.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../model/register/register_withCode/register_code_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../core/constants/navigation/navigation_constants.dart';
import '../model/register/authentication_register_model.dart';

import '../model/login/authentication_model.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/network/vexena_manager.dart';
import '../service/IAuthentication_service.dart';
import '../service/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'authentication_view_model.g.dart';

class AuthenticationViewModel = _AuthenticationViewModelBase
    with _$AuthenticationViewModel;

abstract class _AuthenticationViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<FormState> formSignUpState = GlobalKey();
  GlobalKey<FormState> codeFormState = GlobalKey();
  GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();
  late IAuthenticationService authenticationService;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameSurnameController;
  TextEditingController? emailSignUpController;
  TextEditingController? passwordSignUpController;
  @observable
  late TextEditingController randomCodeGetUser = TextEditingController();
  late TextEditingController controller = TextEditingController();
  late TextEditingController controller1 = TextEditingController();
  late TextEditingController controller2 = TextEditingController();
  late TextEditingController controller3 = TextEditingController();
  late TextEditingController controller4 = TextEditingController();
  late TextEditingController controller5 = TextEditingController();

  late FocusNode pin2FocusNode = FocusNode();
  late FocusNode pin3FocusNode = FocusNode();
  late FocusNode pin4FocusNode = FocusNode();
  late FocusNode pin5FocusNode = FocusNode();
  late FocusNode pin6FocusNode = FocusNode();
  Timer? _timer;

  late final otpInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 15),
    border: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    enabledBorder: outlineInputBorder(),
  );

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Color(0xFF72A863)),
    );
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
    authenticationService =
        AuthenticationService(VexanaManager.instance!.networkManager, context);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameSurnameController = TextEditingController();
    emailSignUpController = TextEditingController();
    passwordSignUpController = TextEditingController();
  }

  @observable
  String randomCodeInput = '';

  @observable
  bool isEyeOpen = false;

  @observable
  bool isLoading = false;

  @observable
  bool isLoginOrSignUp = true;

  @observable
  bool isSuccess = false;

  @observable
  String mobilePermissions = '';

  @override
  void init() {}

  @action
  void changedLoading() {
    isLoading = !isLoading;
  }

  @action
  void successChanged() {
    isSuccess = !isSuccess;
  }

  @action
  void changedTabBar() {
    isLoginOrSignUp = !isLoginOrSignUp;
  }

  @action
  void isEyeOpenFun() {
    isEyeOpen = !isEyeOpen;
  }

  void setTranslate() {
    Locale('tr', 'TR');
  }

  @action
  Future<void> setUserPermissions() async {
    mobilePermissions =
        await rootBundle.loadString('asset/permissons/permissions.txt');
  }

  @action
  void changeCheckBox(bool? value) {
    if (value != null) {
      isChecked = !isChecked;
      print('isChecked $isChecked');
    }
  }

  @observable
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    // ignore: omit_local_variable_types
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @action
  showPermissions(BuildContext context) async {
    await setUserPermissions();
    // set up the button
    Widget okButton = ElevatedButton(
      child: Text('Kabul ediyorum',
          style: context.textTheme.subtitle1!.copyWith(color: Colors.black)),
      onPressed: () async {
        if (!isChecked) {
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Kullanıcı Sözleşmesi kabul edilmelidir.'),
                content: Text(
                    'Uygulamaya devam etmek için lütfen sözleşmemizi okuyup kabul ediyorum işaretlemeniz gerekmektedir.'),
                actions: [
                  ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Tamam',
                          style: context.textTheme.subtitle1!
                              .copyWith(color: Colors.black)))
                ],
              );
            },
          );
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Sözleşme kabul edildi. Lütfen kayıt olurken bekleyiniz..',
                style:
                    context.textTheme.headline5!.copyWith(color: Colors.black),
              ),
            ),
          );
          await fetchSignUpService();
        }
        //
      },
    );

    // set up the AlertDialog
    // ignore: omit_local_variable_types
    AlertDialog alert = AlertDialog(
      title: Text('Kullanıcı verileri Sözleşmesi'),
      content: Scrollbar(
          isAlwaysShown: true,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Text('$mobilePermissions'),
              Observer(builder: (_) {
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Checkbox(
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            changeCheckBox(value);
                            print(value);
                          }),
                    ),
                    Expanded(
                        flex: 4,
                        child: Text(
                            'Kullanıcı sözleşmesini okudum ve kabul ediyorum.'))
                  ],
                );
              })
            ],
          ))),
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

  void disposeMethod() {
    emailController?.dispose();
    passwordController?.dispose();
    nameSurnameController?.dispose();
    emailSignUpController?.dispose();
    passwordSignUpController?.dispose();
    randomCodeGetUser.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
    controller.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    _timer?.cancel();
  }

  @action
  Future<void> fetchLoginService() async {
    changedLoading();
    if (formState.currentState!.validate() && isLoginOrSignUp) {
      final response = await authenticationService.fetchUserControl(
          AuthenticationModel(
              email: emailController!.text,
              password: passwordController!.text));
      if (response != null && response.success == true) {
        await localeManager.setTokenManager(
            PreferencesKeys.TOKEN, response.token.toString());
        await localeManager.setTokenManager(
            PreferencesKeys.ID, response.id.toString());
        await navigation.navigateToPageClear(
            path: NavigationConstants.HOME_VIEW);
      }
    }
    changedLoading();
  }

  @action
  Future<void> fetchSignUpService() async {
    changedLoading();
    if (formSignUpState.currentState!.validate() && !isLoginOrSignUp) {
      final response = await authenticationService.registerUserControl(
          AuthenticationRegisterModel(
              name: nameSurnameController!.text,
              email: emailSignUpController!.text,
              password: passwordSignUpController!.text));
      if (response != null) {
        successChanged();
        changedLoading();
        timerCount = 60;
        if (response.register!) {
          showLoginNumberCode(context);
        }
      }
    }
    changedLoading();
  }

  @action
  Future<void> codeWithSuccess() async {
    if (codeFormState.currentState!.validate()) {
      final response = await authenticationService
          .registerSuccessWithCodeControl(RegisterCode(
              name: nameSurnameController!.text,
              email: emailSignUpController!.text,
              password: passwordSignUpController!.text,
              randomCodeReq: int.parse(randomCodeInput)));
      print(nameSurnameController!.text);
      print(emailSignUpController!.text);
      print(passwordSignUpController!.text);
      print(int.parse(randomCodeInput));
      if (response != null) {
        successChanged();
        changedLoading();
        print(response.success);
        if (response.success!) {
          await navigation.navigateToPageClear(
              path: NavigationConstants.HOME_VIEW);
        }
      }
    } else {
      Navigator.pop(context);
    }
    changedLoading();
  }

  @action
  showLoginNumberCode(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text('OK', style: TextStyle(color: Colors.black)),
      onPressed: () async {
        Navigator.pop(context);
        changedLoading();
        await codeWithSuccess();
        _timer?.cancel();
        timerCount = 0;
        controller.clear();
        controller1.clear();
        controller2.clear();
        controller3.clear();
        controller4.clear();
        controller5.clear();
      },
    );
    Widget ok2Button = FlatButton(
      child: Text('OK', style: TextStyle(color: Colors.black)),
      onPressed: () {
        Navigator.pop(context);
        changedLoading();
        _timer?.cancel();
        timerCount = 0;
        controller.clear();
        controller1.clear();
        controller2.clear();
        controller3.clear();
        controller4.clear();
        controller5.clear();
      },
    );

    // set up the AlertDialog
    // ignore: omit_local_variable_types
    AlertDialog alertBasaramadik = AlertDialog(
      title: Text('Başarısız oldu.'),
      content: Lottie.asset('asset/lottie/try-again-opps.json'),
      actions: [
        ok2Button,
      ],
    );

    // set up the AlertDialog
    // ignore: omit_local_variable_types
    AlertDialog alert = AlertDialog(
      title: Text('Lütfen Gelen Kodu Giriniz'),
      content: Form(
        child: Container(
          height: context.height * 0.15,
          child: Column(
            children: [
              Observer(builder: (_) {
                return Text(timerCount.toString());
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  context.emptySizedHeightBoxLow,
                  SizedBox(
                    width: context.width * 0.08,
                    height: context.height * 0.05,
                    child: TextFormField(
                      autofocus: true,
                      style: TextStyle(fontSize: 24),
                      controller: controller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) {
                        nextField(value, pin2FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.08,
                    height: context.height * 0.05,
                    child: TextFormField(
                      focusNode: pin2FocusNode,
                      autofocus: true,
                      controller: controller1,
                      style: TextStyle(fontSize: 24),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) {
                        nextField(value, pin3FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.08,
                    height: context.height * 0.05,
                    child: TextFormField(
                      focusNode: pin3FocusNode,
                      autofocus: true,
                      controller: controller2,
                      style: TextStyle(fontSize: 24),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) {
                        nextField(value, pin4FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.08,
                    height: context.height * 0.05,
                    child: TextFormField(
                      focusNode: pin4FocusNode,
                      autofocus: true,
                      controller: controller3,
                      style: TextStyle(fontSize: 24),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) {
                        nextField(value, pin5FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.08,
                    height: context.height * 0.05,
                    child: TextFormField(
                      autofocus: true,
                      controller: controller4,
                      focusNode: pin5FocusNode,
                      style: TextStyle(fontSize: 24),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) {
                        nextField(value, pin6FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.08,
                    height: context.height * 0.05,
                    child: TextFormField(
                      focusNode: pin6FocusNode,
                      autofocus: true,
                      controller: controller5,
                      style: TextStyle(fontSize: 24),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) {
                        if (value.length == 1) {
                          pin6FocusNode.unfocus();
                          randomCodeInput = controller.text +
                              controller1.text +
                              controller2.text +
                              controller3.text +
                              controller4.text +
                              controller5.text;
                          print(randomCodeInput);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        timerFunction();
        return Observer(builder: (_) {
          return timerCount == 0
              ? alertBasaramadik
              : Form(
                  key: codeFormState,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: alert,
                );
        });
      },
    );
  }

  @action
  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @observable
  int timerCount = 60;

  @action
  void timerFunction() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // ignore: unrelated_type_equality_checks
      if (timerCount == 0) {
        print('bitti');
        _timer?.cancel();
      } else {
        // print(timer.tick);
        timerCount--;
      }
    });
  }
}

/*

SizedBox(
              height: context.height * 0.3,
              child: TextFormField(
                focusNode: pin2FocusNode,
                obscureText: true,
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value) => nextField(value, pin3FocusNode),
              ),
            ),
            SizedBox(
              height: context.height * 0.3,
              child: TextFormField(
                focusNode: pin3FocusNode,
                obscureText: true,
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value) => nextField(value, pin4FocusNode),
              ),
            ),
            SizedBox(
              height: context.height * 0.3,
              child: TextFormField(
                focusNode: pin4FocusNode,
                obscureText: true,
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value) {
                  if (value.length == 1) {
                    pin4FocusNode.unfocus();
                    // Then you need to check is the code is correct or not
                  }
                },
              ),
            ), 

            */
