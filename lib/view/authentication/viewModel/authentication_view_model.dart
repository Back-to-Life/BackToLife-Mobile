import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/network/vexena_manager.dart';
import '../model/authentication_model.dart';
import '../service/IAuthentication_service.dart';
import '../service/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'authentication_view_model.g.dart';

class AuthenticationViewModel = _AuthenticationViewModelBase
    with _$AuthenticationViewModel;

abstract class _AuthenticationViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  TextEditingController emailController;
  TextEditingController passwordController;
  IAuthenticationService authenticationService;
  void setContext(BuildContext context) {
    this.context = context;
    authenticationService =
        AuthenticationService(VexanaManager.instance.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isEyeOpen = false;

  @observable
  bool isLoading = false;

  void init() {}

  @action
  void changedLoading() {
    isLoading = !isLoading;
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
    if (formState.currentState.validate()) {
      final response = await authenticationService.fetchUserControl(
          AuthenticationModel(
              email: emailController.text, password: passwordController.text));
      //print(response.success);
      if (response != null) {
        scaffoldState.currentState.showSnackBar(SnackBar(
          content: Text("Giriş Başarılı"),
        ));
      }
    }
    changedLoading();
  }
}
