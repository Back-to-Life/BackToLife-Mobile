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
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  TextEditingController emailController;
  TextEditingController passwordController;
  IAuthenticationService authenticationService;
  TextEditingController nameSurnameController;
  TextEditingController emailSignUpController;
  TextEditingController passwordSignUpController;

  @override
  void setContext(BuildContext context) {
    this.context = context;
    authenticationService =
        AuthenticationService(VexanaManager.instance.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameSurnameController = TextEditingController();
    emailSignUpController = TextEditingController();
    passwordSignUpController = TextEditingController();
  }

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

  @action
  Future<void> fetchLoginService() async {
    changedLoading();
    if (formState.currentState.validate() && isLoginOrSignUp) {
      final response = await authenticationService.fetchUserControl(
          AuthenticationModel(
              email: emailController.text, password: passwordController.text));
      if (response != null) {
        scaffoldState.currentState.showSnackBar(SnackBar(
          content: Text('Giriş Başarılı'),
        ));
      }
    }
    changedLoading();
  }

  @action
  Future<void> fetchSignUpService() async {
    changedLoading();
    if (formSignUpState.currentState.validate() && !isLoginOrSignUp) {
      final response = await authenticationService.registerUserControl(
          AuthenticationRegisterModel(
              firstName: nameSurnameController.text,
              email: emailSignUpController.text,
              password: passwordSignUpController.text));
      print(nameSurnameController.text);
      print(emailSignUpController.text);
      print(passwordSignUpController.text);
      if (response != null) {
        successChanged();
        changedLoading();
        await navigation.navigateToPageClear(
            path: NavigationConstants.HOME_VIEW);
      }
    }
    changedLoading();
  }
}
