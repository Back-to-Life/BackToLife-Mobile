import '../model/account_settings_request_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../../../core/extension/context_extension.dart';
import '../service/IAccountService.dart';
import '../service/account_service.dart';

part 'account_settings_view_model.g.dart';

class AccountSettingsViewModel = _AccountSettingsViewModelBase
    with _$AccountSettingsViewModel;

abstract class _AccountSettingsViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formStateAccount = GlobalKey();
  GlobalKey<FormState> formStateEmail = GlobalKey();
  late TextEditingController userName = TextEditingController();
  late TextEditingController email = TextEditingController();
  late FocusNode myFocusNode1 = FocusNode();
  late FocusNode myFocusNode2 = FocusNode();
  late IAccountService _accountService;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    _accountService = AccountSettingsService(dio);
  }

  @action
  Future<void> changeNameAndEmail() async {
    if (email.text.isNotEmpty || userName.text.isNotEmpty) {
      if (email.text.isEmpty) {
        if (formStateAccount.currentState!.validate()) {
          print('just account ${userName.text.toString()}');
          var _response = await _accountService.changeNameAndEmail(
              AccountSettingsModel(name: userName.text.toString()));
          checkResponse(_response);
        }
      } else if (userName.text.isEmpty) {
        if (formStateEmail.currentState!.validate()) {
          var _response = await _accountService.changeNameAndEmail(
              AccountSettingsModel(email: email.text.toString()));
          checkResponse(_response);
        }
      } else {
        if (formStateEmail.currentState!.validate() &&
            formStateAccount.currentState!.validate()) {
          var _response = await _accountService.changeNameAndEmail(
              AccountSettingsModel(
                  email: email.text.toString(),
                  name: userName.text.toString()));
          checkResponse(_response);
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter value !!',
            style: context.textTheme.headline5!.copyWith(color: Colors.black),
          ),
        ),
      );
    }
  }

  Future<void> checkResponse(bool response) async {
    if (response) {
      userName.clear();
      email.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Changed Success !!',
            style: context.textTheme.headline5!.copyWith(color: Colors.black),
          ),
        ),
      );
      await Future.delayed(Duration(seconds: 2));
      await navigation.pop();
    } else {
      userName.clear();
      email.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Something Wrong !!',
            style: context.textTheme.headline5!.copyWith(color: Colors.black),
          ),
        ),
      );
    }
  }
}
