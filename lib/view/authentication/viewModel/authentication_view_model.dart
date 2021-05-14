import 'dart:async';

import 'package:backtolife/core/extension/context_extension.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  late Timer _timer;

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
        AuthenticationService(VexanaManager.instance!.networkManager);
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

  void disposeMethod() {
    emailController!.dispose();
    passwordController!.dispose();
    nameSurnameController!.dispose();
    emailSignUpController!.dispose();
    passwordSignUpController!.dispose();
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
    _timer.cancel();
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
              firstName: nameSurnameController!.text,
              email: emailSignUpController!.text,
              password: passwordSignUpController!.text));
      if (response != null) {
        successChanged();
        changedLoading();
        await navigation.navigateToPageClear(
            path: NavigationConstants.HOME_VIEW);
      }
    }
    changedLoading();
  }

  @action
  showLoginNumberCode(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text('OK', style: TextStyle(color: Colors.black)),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    // ignore: omit_local_variable_types
    AlertDialog alertBasaramadik = AlertDialog(
      title: Text('BAŞARAMADIK'),
      content: Text('NEYİ BAŞARAMADIN ABİ'),
      actions: [
        okButton,
      ],
    );

    // set up the AlertDialog
    // ignore: omit_local_variable_types
    AlertDialog alert = AlertDialog(
      title: Text('Lütfen Gelen Kodu Giriniz'),
      content: Form(
        child: Container(
          height: context.height * 0.25,
          child: Column(
            children: [
              Observer(builder: (_) {
                return Text(_timerCount.toString());
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
                          // controller.clear();
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
        return Observer(builder: (_) {
          return _timerCount == 0
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

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('This code will expired in '),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, value, child) => Text(
            '00:${value}',
            style: TextStyle(color: Colors.orange),
          ),
        ),
      ],
    );
  }

  @action
  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @observable
  int _timerCount = 15;

  @action
  void timerFunction() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // ignore: unrelated_type_equality_checks
      if (_timerCount == 0) {
        print('bitti');
        _timer.cancel();
      } else {
        print(timer.tick);
        _timerCount--;
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